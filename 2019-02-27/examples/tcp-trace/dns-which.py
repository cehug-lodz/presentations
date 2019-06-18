#!/usr/bin/python3

import ctypes as ct
import socket
import subprocess
import sys
import argparse
from functools import partial

import bcc

BPF_TEXT = '''
#include <uapi/linux/ptrace.h>
#include <net/sock.h>
#include <linux/socket.h>
#include <linux/in.h>
#include <linux/in6.h>

BPF_PERF_OUTPUT(events);

struct data_t {
    u32 family;
    u32 pid;
    u32 port;
    struct in_addr in;
};

/* UDP in IPv4 */
int kprobe__udp_sendmsg(struct pt_regs *ctx, struct sock *sk, struct msghdr *msg, size_t len) {
    struct data_t event = {};
    u32 tgid = bpf_get_current_pid_tgid() >> 32;
    event.pid = tgid;
    event.family = sk->__sk_common.skc_family;
    if (sk->sk_state == TCP_ESTABLISHED) {
        event.port = sk->__sk_common.skc_dport;
        event.in.s_addr = sk->__sk_common.skc_daddr;
    } else {
        struct sockaddr_in *addr = (struct sockaddr_in *)msg->msg_name;
        event.port = addr->sin_port;
        event.in = addr->sin_addr;
    }

    events.perf_submit(ctx, &event, sizeof(event));
    return 0;
}
'''

class AddrUnion(ct.Union):
    _fields_ = [
        ("in_addr", 4 * ct.c_ubyte),
        ("in6_addr", 16 * ct.c_ubyte),
    ]

class Sample(ct.Structure):
    _fields_ = [
        ("family", ct.c_uint),
        ("pid", ct.c_uint),
        ("port", ct.c_uint),
        ("addr", AddrUnion)
    ]

def print_event(wanted_pid, cpu, data, size):
    sample = ct.cast(data, ct.POINTER(Sample)).contents
    if sample.pid == wanted_pid:
        print("-- trace: family:", "inet" if sample.family == socket.AF_INET else sample.family,
              "pid:", sample.pid, "addr:", socket.inet_ntoa(sample.addr.in_addr),
              "port:", socket.ntohs(sample.port),
              file=sys.stderr)

def parse_arguments():
    parser = argparse.ArgumentParser(description='demo')
    parser.add_argument('--debug-source', default=False,
                        action='store_true', help='debug source')
    parser.add_argument('--debug-bpf', default=False,
                        action='store_true', help='debug BPF')
    parser.add_argument('command', nargs='+')
    return parser.parse_args()

def main(opts):
    debug_flags = 0
    if opts.debug_source:
        debug_flags = bcc.DEBUG_SOURCE
    if opts.debug_bpf:
        debug_flags = bcc.DEBUG_BPF

    b = bcc.BPF(text=BPF_TEXT, debug=debug_flags)

    if opts.debug_source or opts.debug_bpf:
        raise SystemExit(0)

    print("starting child process:", opts.command)
    comm = subprocess.Popen(opts.command)

    print("forked child as:", comm.pid)
    b['events'].open_perf_buffer(partial(print_event, comm.pid))

    while True:
        try:
            b.perf_buffer_poll(timeout=5)
            if comm.poll() is not None:
                break
        except KeyboardInterrupt:
            exit()

    comm.terminate()
    comm.wait()

if __name__ == '__main__':
    opts = parse_arguments()
    main(opts)
