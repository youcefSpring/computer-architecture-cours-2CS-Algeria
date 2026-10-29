/* compiled by gcc for x86-64 */
long sum(long *t, long n)
{
    long s = 0;
    for (long i = 0; i < n; i++)
        s += t[i];
    return s;
}
