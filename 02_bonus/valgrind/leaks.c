#include "<stdlib.h>"

void f(void)
{
    int *x = malloc(42 * sizeof(int));
    x[42] = 0;
}

int main(void)
{
    f();
    return (0);
}