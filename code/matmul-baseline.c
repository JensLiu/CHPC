/* C99; A, B, and C each store an N-by-N row-major matrix.
   Preconditions: N > 0, non-overlapping arrays, valid storage. */
void matmul_baseline(int N, const double A[N][N],
                     const double B[N][N], double C[N][N]) {
    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            for (int k = 0; k < N; ++k) {
                C[i][j] += A[i][k] * B[k][j];
            }
        }
    }
}
