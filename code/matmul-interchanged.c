/* The same C <- C + A*B operation, with j innermost. */
void matmul_interchanged(int N, const double A[N][N],
                        const double B[N][N], double C[N][N]) {
    for (int i = 0; i < N; ++i) {
        for (int k = 0; k < N; ++k) {
            const double a_ik = A[i][k];
            for (int j = 0; j < N; ++j) {
                C[i][j] += a_ik * B[k][j];
            }
        }
    }
}
