/* ax(1-x) this time with attractors */

#include <math.h>
#include <stdio.h>

double functionof(double aaa, double value);
void loop(double aaa);
double roundto(double value, double precision);

int main(void)
{
    double aaa = 3.72;
    while (aaa <= 3.78) {
        loop(aaa);
        aaa += 0.01;
    }
    return 0;
}

inline double functionof(double aaa, double value)
{
    return aaa * value * (1 - value);
}

void loop(double aaa)
{
    double value = 0.01;
    double pair[2];
    while (value < 1.0) {
        pair[0] = value;
        for (int i = 0; i < 100; i++) {
            pair[0] = functionof(aaa, pair[0]);
            if (isnan(pair[0]) || isinf(pair[0]))
                goto NEXT_VALUE;
        }
        pair[1] = fabs(roundto(functionof(aaa, pair[0]), 0.1));
        pair[0] = fabs(roundto(pair[0], 0.1));
        printf("%.2f %.3f %.1f %.1f\n", aaa, value, pair[0], pair[1]);
      NEXT_VALUE:
        value += 0.07;
    }
}

inline double roundto(double value, double precision)
{
    return value - remainder(value, precision);
}
