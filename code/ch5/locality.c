/* Same sum, two orders: row by row, or column by column */
#include <stdio.h>
#include <time.h>

#define N 4096
static int m[N][N];                 /* 4096 x 4096 ints = 64 MB */

static double now(void)
{
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

int main(void)
{
    long s = 0;
    double t;
    for (int i = 0; i < N; i++)
        for (int j = 0; j < N; j++)
            m[i][j] = 1;

    t = now();
    for (int i = 0; i < N; i++)      /* row by row: neighbours */
        for (int j = 0; j < N; j++)
            s += m[i][j];
    printf("rows    : %.3f s\n", now() - t);

    t = now();
    for (int j = 0; j < N; j++)      /* column by column: jumps */
        for (int i = 0; i < N; i++)
            s += m[i][j];
    printf("columns : %.3f s\n", now() - t);
    printf("sum = %ld\n", s);
    return 0;
}
