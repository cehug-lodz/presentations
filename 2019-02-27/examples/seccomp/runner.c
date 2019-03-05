#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <linux/audit.h>
#include <linux/filter.h>
#include <linux/seccomp.h>
#include <stdarg.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/prctl.h>
#include <sys/ptrace.h>
#include <sys/stat.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <unistd.h>

#define MAX_SIZE (100 * 1024)

void die(const char *msg, ...) {
  int saved_errno = errno;
  va_list va;
  va_start(va, msg);
  vfprintf(stderr, msg, va);
  va_end(va);

  if (errno != 0) {
    fprintf(stderr, ": %s\n", strerror(saved_errno));
  } else {
    fprintf(stderr, "\n");
  }
  _exit(1);
}

char *read_prog(const char *path, size_t *size) {
  struct stat pstat;
  assert(size != NULL);
  if (stat(path, &pstat) != 0) {
    die("failed to stat %s", path);
  }
  if (pstat.st_size >= MAX_SIZE) {
    die("too large: %d\n", pstat.st_size);
  }
  int fd = open(path, 0);
  char *buf = calloc(1, pstat.st_size);
  if (buf == NULL) {
    die("failed to allocate memory");
  }

  size_t rd = read(fd, buf, pstat.st_size);
  if (rd == -1) {
    die("failed to read program data");
  }
  close(fd);

  *size = pstat.st_size;
  return buf;
}

#ifndef seccomp
// prototype because we build with -Wstrict-prototypes
int seccomp(unsigned int operation, unsigned int flags, void *args);

int seccomp(unsigned int operation, unsigned int flags, void *args) {
  errno = 0;
  return syscall(__NR_seccomp, operation, flags, args);
}
#endif

int main(int argc, char *argv[]) {
  if (argc != 2) {
    fprintf(stderr, "error: missing BPF program path");
    return 1;
  }

  size_t bpf_prog_size = 0;
  char *bpf_prog = read_prog(argv[1], &bpf_prog_size);

  struct sock_fprog prog = {
      .len = bpf_prog_size / sizeof(struct sock_filter),
      .filter = (struct sock_filter *)bpf_prog,
  };
  if (seccomp(SECCOMP_SET_MODE_FILTER, SECCOMP_FILTER_FLAG_LOG, &prog) != 0) {
    die("failed to setup seccomp");
  }

  /* filter attached */
  int fd = open("/proc/self/exe", 0);
  assert(fd == 3);
  char buf;
  /* THIS SHOULD FAIL */
  ssize_t rd = read(fd, &buf, 1);
  assert(rd == -1);
  perror("read() failed");
  close(fd);
  return 0;
}
