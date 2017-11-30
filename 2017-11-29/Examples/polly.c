static void kernel_2mm(int ni, int nj, int nk, int nl, double alpha,
                       double beta, double tmp[1024 + 0][1024 + 0],
                       double A[1024 + 0][1024 + 0],
                       double B[1024 + 0][1024 + 0],
                       double C[1024 + 0][1024 + 0],
                       double D[1024 + 0][1024 + 0]) {
  int i, j, k;

#pragma scop

  for (i = 0; i < ni; i++)
    for (j = 0; j < nj; j++) {
      tmp[i][j] = 0;
      for (k = 0; k < nk; ++k)
        tmp[i][j] += alpha * A[i][k] * B[k][j];
    }
  for (i = 0; i < ni; i++)
    for (j = 0; j < nl; j++) {
      D[i][j] *= beta;
      for (k = 0; k < nj; ++k)
        D[i][j] += tmp[i][k] * C[k][j];
    }
#pragma endscop
}

