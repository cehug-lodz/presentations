int foo(int n) {
  int res;
  int a[10];
  for (int i = 0; i < 10; 
		  i++) {
    res = n + 5;
    a[i] = i;
  }
  return res + a[2];
}
