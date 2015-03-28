/* Something ported however horribly by me from "Algorithms" (4th edition)
 * by Robert Sedgewick and Kevin Wayne, to find connections between numbers. */

#include "connected.h"

uint8_t *Id, *Sz;
int Num, Count;

int conn_count(void)
{
    return Count;
}

/* "path compression" code disabled as too much of a pain to write a portable
 * version of reallocarray(3) for non-OpenBSD systems. */
uint8_t conn_find(uint8_t p)
{
/*  uint8_t *seen;
    size_t seen_len = 8;
    size_t seen_idx = 0;

    if ((seen = calloc(seen_len, sizeof(uint8_t))) == NULL)
        err(EX_OSERR, "could not calloc() seen list"); */

    while (p != Id[p]) {
/*      seen[seen_idx++] = p; */
        p = Id[p];
/*      if (seen_idx >= seen_len) {
            seen_len <<= 1;
            if ((seen = reallocarray(seen, seen_len, sizeof(uint8_t))) == NULL)
                err(EX_OSERR, "could not calloc() seen list");
        } */
    }
/*  seen_len = seen_idx;

    for (seen_idx = 0; seen_idx < seen_len; seen_idx++) {
        Id[seen[seen_idx]] = p;
    } */

    return p;
}

void conn_init(void)
{
    if ((Id = calloc((size_t)UINT8_MAX+1, sizeof(uint8_t))) == NULL)
        err(EX_OSERR, "could not calloc() Id list");
    if ((Sz = calloc((size_t)UINT8_MAX+1, sizeof(uint8_t))) == NULL)
        err(EX_OSERR, "could not calloc() Sz list");
    for (int i = 0; i <= UINT8_MAX; i++) {
        Id[i] = i;
        Sz[i] = 1;
    }
    Count = UINT8_MAX+1;
}

bool conn_isconn(uint8_t p, uint8_t q)
{
    return Id[p] == Id[q];
}

void conn_mkunion(uint8_t p, uint8_t q)
{
    uint8_t i = conn_find(p);
    uint8_t j = conn_find(q);
    if (i == j)
        return;

    if (Sz[i] < Sz[j]) {
        Id[i] = j;
        Sz[j] += Sz[i];
    } else {
        Id[j] = i;
        Sz[i] += Sz[j];
    }
    Count--;
}
