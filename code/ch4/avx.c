/* AVX: add 8 floats with one instruction */
#include <stdio.h>
#include <immintrin.h>

int main(void)
{
    float a[8] = {1, 2, 3, 4, 5, 6, 7, 8};
    float b[8] = {10, 20, 30, 40, 50, 60, 70, 80};
    float c[8];

    __m256 x = _mm256_loadu_ps(a);   /* 8 floats in a YMM register */
    __m256 y = _mm256_loadu_ps(b);
    _mm256_storeu_ps(c, _mm256_add_ps(x, y));   /* vaddps */

    for (int i = 0; i < 8; i++)
        printf("%.0f ", c[i]);
    printf("\n");
    return 0;
}
