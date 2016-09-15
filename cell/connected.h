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

int conn_count(void);
uint8_t conn_find(uint8_t p);
void conn_init(void);
bool conn_isconn(uint8_t p, uint8_t q);
void conn_mkunion(uint8_t p, uint8_t q);
