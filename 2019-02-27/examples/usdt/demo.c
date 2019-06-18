#include <sys/sdt.h>
#include <stdio.h>
#include <unistd.h>

void foo(size_t cnt) {
  DTRACE_PROBE1(demo, foo, cnt);
  if (cnt % 2 == 0) printf("foo\n");
  else printf("oof\n");
}

void bar(size_t cnt) {
  DTRACE_PROBE1(demo, bar, cnt);
  if (cnt % 2 == 0) printf("bar\n");
  else printf("rab\n");
}

int main(int argc, char *argv[]) {

  int cnt = 0;
  while (1) {
    foo(cnt); bar(cnt); sleep(1);
    cnt++;
  }
  return 0;
}
