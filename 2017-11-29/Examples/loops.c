void detect() {
	char a[10];
	char b[10];
	int j =0;
	while (j <10){
	for (int i =0; i < 10; i++) {
		a[i] = i + j;
	}
	j++;
	}
	int k =0;
loop_begin:
	b[k] = k;
	k++;
	if (k <10)
		goto loop_begin;

}
