/* ax(1-x) over an arbitrary range and to arbitrary precision
 *
 * "CHAOS: An Introduction to Dynamical Systems" may help explain what
 * this code is doing.
 */

#include <math.h>
#include <stdio.h>

double functionof(double aaa, double value);
void loop(double aaa);
double roundto(double value, double precision);

int main(void)
{
    double aaa = 3.72;
    while (aaa <= 4.0) {
        loop(aaa);
        aaa += 0.01;
    }
    return 0;
}

inline double functionof(double aaa, double value)
{
    return aaa * value * (1 - value);
}

/* Over the range 0.01 <= x < 1.0 look for attractors that are neither
 * infinite nor not-a-number and if there is a change from the
 * previous attractor print where in the range and what the resulting
 * attractor is. The midiify code then uses these values to construct
 * the MIDI output.
 */
void loop(double aaa)
{
    double value = 0.01;
    double outcome, last = NAN;
    while (value < 1.0) {
        outcome = value;
        for (int i = 0; i < 100; i++) {
            double nochange = outcome;
            outcome = functionof(aaa, outcome);
            if (isnan(outcome) || isinf(outcome))
                goto NEXT_VALUE;
            if (outcome == nochange)
                break;
        }
        outcome = roundto(outcome, 0.1);
        if (outcome != last) {
            printf("a=%.2f\t%.3f %.2f\n", aaa, value, outcome);
            last = outcome;
        }
      NEXT_VALUE:
        value += 0.07;
    }
}

inline double roundto(double value, double precision)
{
    return value - remainder(value, precision);
}
