char glob[40];

int analysis(char **ptr) {
  char local[40];
  local[1] = 'a';
  int res;
  res = **ptr + 2 + local[1];
  return res;
}
