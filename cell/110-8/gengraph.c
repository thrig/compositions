/*                     Rule 110, 8-bit playfield.
 *
 * Produces output for graphviz (or anything that can read such, e.g.
 * OmniGraffle or the like). The output should be filtered for
 * duplicates because I haven't spent the time to figure out how to do
 * that in C. Usage might run something like:
 *
 *   gmake gengraph
 *   ./gengraph | perl -ne 'print unless $s{$_}++' > foo.dot
 *   neato -Gstart=rand -Tpng -o foo.png foo.dot
 */

#include "connected.h"

#define FIELD_WIDTH 8
#define OUTCOMES_WIDTH 8

#define IFYOUHAVETOASK 640

int main(void)
{
    /* except of course these numbers can be fiddled with to produce
     * different graphs */
    bool outcomes[OUTCOMES_WIDTH] = { 0, 1, 1, 1, 0, 1, 1, 0 };

    conn_init();

    printf("digraph x {\n");

    for (unsigned long sfield = 0; sfield <= UINT8_MAX; sfield++) {
        unsigned int iters = 0;
        uint8_t field1 = sfield;
        uint8_t pfield = sfield;

        while (++iters < IFYOUHAVETOASK) {
            uint8_t field2 = 0;

            for (int self = 0; self < FIELD_WIDTH; self++) {
                int index;
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

            /* TODO would like to emit individual graph files for each group
             * or at least to tag each such line as such (and also not
             * emit already emitted pairs...) */
            //if (field1 != 0)
                printf("  %u -> %u;\n", pfield, field1);

            /* Bail if already connected to start node; this kills
             * loops, so the IFYOUHAVETOASK is not really needed. */
            if (conn_isconn(sfield, field1))
                break;

            if (!conn_isconn(pfield, field1))
                conn_mkunion(sfield, field1);

            pfield = field1;
        }
    }

    printf("}\n");
    exit(0);
}
