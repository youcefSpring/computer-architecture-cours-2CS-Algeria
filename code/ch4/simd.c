/* SSE: add 4 floats with one instruction */
#include <stdio.h>
#include <xmmintrin.h>

int main(void)
{
    float a[4] = {1.5, 2.5, 3.5, 4.5};
    float b[4] = {10, 20, 30, 40};
    float c[4];

    __m128 x = _mm_loadu_ps(a);   /* load 4 floats into XMM */
    __m128 y = _mm_loadu_ps(b);
    __m128 z = _mm_add_ps(x, y);  /* ONE instruction: addps */
    _mm_storeu_ps(c, z);

    printf("%.1f %.1f %.1f %.1f\n", c[0], c[1], c[2], c[3]);
    return 0;
}
