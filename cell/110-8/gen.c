/*
 * Rule 110, 8-bit playfield.
 *
 * NOTE code written on a little-endian system and probably will need
 * porting to a system of some other endianess.
 *
 * Usage:
 *   make gen && ./gen num
 *
 * where num is a number from 0 to 255 inclusive.
 */

#include <err.h>
#include <errno.h>
#include <limits.h>
#include <math.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <sysexits.h>
#include <time.h>
#include <unistd.h>

#define FIELD_WIDTH 8
#define OUTCOMES_WIDTH 8

#define IFYOUHAVETOASK 42

int main(int argc, char *argv[])
{
    bool outcomes[OUTCOMES_WIDTH] = { 0, 1, 1, 1, 0, 1, 1, 0 };
    int index;
    uint8_t field1;
    unsigned int iters = 0;
    unsigned int input;

    argv++;                     // skip prog name
    sscanf(*argv++, "%3u", &input);
    argc -= 2;
    if (input > UINT8_MAX)
        errx(EX_DATAERR, "input number must be in range 0..%u", UINT8_MAX);
    field1 = input;

    while (++iters < IFYOUHAVETOASK) {
        uint8_t field2 = 0;
        for (unsigned int i = 0; i < FIELD_WIDTH; i++) {
            putchar(((field1 >> i) & 1) ? 'X' : '.');
        }
        printf(" %3u\n", (unsigned int) field1);

        for (int self = 0; self < FIELD_WIDTH; self++) {
            int prev = self - 1;
            int next = self + 1;
            /* Wrap the field around so do not have to worry about
             * (undefined) handling of edge conditions. */
            if (prev < 0)
                prev = FIELD_WIDTH - 1;
            if (next > FIELD_WIDTH - 1)
                next = 0;

            index =
                ((field1 >> prev & 1) << 2) | ((field1 >> self & 1) << 1) |
                (field1 >> next & 1);
            field2 |= outcomes[index] << self;
        }
        field1 = field2;

        if (field1 == 0 || field1 == UINT8_MAX) {
            printf("hilo %u at %u\n", field1, iters);
            exit(0);
        }
    }
    printf("loop %u\n", iters);
    exit(0);
}
