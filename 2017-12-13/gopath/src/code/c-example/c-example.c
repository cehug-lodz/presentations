#include <stdio.h>

#define ARR_SIZE(__x) \
  sizeof(__x) / sizeof(__x[0])

int main(int argc, char *argv[]) {
  typedef struct {
    int x;
    unsigned int y;
    const char *t;
  } foo_t;

  foo_t many_foo[] = {
    {1, 2, "foo"},
    {3, 5, "bar"},
  };
  for (size_t i = 0; i < ARR_SIZE(many_foo); i++) {
    printf("%zu: {%d %d \"%s\"}\n", i,
           many_foo[i].x, many_foo[i].y, many_foo[i].t);
  }
  return 0;
}
