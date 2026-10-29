/* Average time of one memory access, for different data sizes.
   Each access depends on the previous one (pointer chasing),
   so the processor cannot guess the next address. */
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static double now(void)
{
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

int main(void)
{
    for (long kb = 16; kb <= 65536; kb *= 4) {
        long n = kb * 1024 / sizeof(long);
        long *next = malloc(n * sizeof(long));
        long *order = malloc(n * sizeof(long));
        for (long i = 0; i < n; i++) order[i] = i;
        for (long i = n - 1; i > 0; i--) {          /* random order */
            long j = rand() % (i + 1), t = order[i];
            order[i] = order[j]; order[j] = t;
        }
        for (long i = 0; i < n; i++)                /* one big cycle */
            next[order[i]] = order[(i + 1) % n];

        long p = 0, steps = 20000000;
        double t0 = now();
        for (long s = 0; s < steps; s++)
            p = next[p];
        double ns = (now() - t0) / steps * 1e9;
        printf("%6ld KB : %5.1f ns%s\n", kb, ns, p < 0 ? "!" : "");
        free(next); free(order);
    }
    return 0;
}
