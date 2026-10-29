/* The same work shared between 1, 2, 4 and 8 threads */
#include <stdio.h>
#include <math.h>
#include <pthread.h>
#include <time.h>

#define WORK 400000000L
static int k;                       /* number of threads */
static double part[8];              /* result of each thread */

static double now(void)
{
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec + t.tv_nsec * 1e-9;
}

static void *worker(void *arg)      /* thread id computes its part */
{
    long id = (long) arg;
    double s = 0;
    for (long i = id; i < WORK; i += k)
        s += sqrt((double) i);
    part[id] = s;
    return NULL;
}

int main(void)
{
    double t1 = 0;
    for (k = 1; k <= 8; k *= 2) {
        pthread_t th[8];
        double t = now(), total = 0;
        for (long id = 0; id < k; id++)
            pthread_create(&th[id], NULL, worker, (void *) id);
        for (int id = 0; id < k; id++) {
            pthread_join(th[id], NULL);
            total += part[id];
        }
        t = now() - t;
        if (k == 1) t1 = t;
        printf("%d thread(s): %.3f s  speedup %.2f\n", k, t, t1 / t);
    }
    return 0;
}
