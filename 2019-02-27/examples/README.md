#### `seccomp`

SECCOMP BPF example, BPF generator and a demo program. Build the generator using
`go build` while inside `seccomp/genprog`. The generator outputs compiled BPF to
its stdout. Pseudocode can be written to a file passed as `-pfc` parameter.

```
$ genprog -pfc profile.pfc > ./profile.bpf
$ sudo demo ./profile.bpf
```

#### `tc-bpf`

Minimal BPF example for `tc`

#### `usdt`

Minimal example of Userspace Statically Defined tracing

```
$ perf buildid-cache --add ./demo
$ perf trace -e sdt_demo:foo,sdt_demo:bar ./demo
```

#### `tcp-trace`

Demo HTTP client using libsoup. See the examples in the presentation.

The `dns-which.py` script is an example of kprobe installed using `bcc` suite.

```
$ sudo ./dns-which.py nslookup google.com 8.8.8.8
$ sudo ./dns-which.py nslookup google.com
$ sudo ./dns-which.py ./demo http://ifconfig.co/json

```
