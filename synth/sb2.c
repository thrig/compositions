/*
 * On OpenBSD, with synth attached:
 *
 *   make sb2
 *   aucat -o rec.wav & ./sb2 ; pkill aucat
 *
 * Then perhaps run sox(1) to normalize the audio.
 */

#include <err.h>
#include <fcntl.h>
#include <limits.h>
#include <math.h>
#include <signal.h>
#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sysexits.h>
#include <time.h>
#include <unistd.h>

#define NOTE_ON (9 << 4)
#define CONTROL_CHANGE (11 << 4)
#define PROGRAM_CHANGE (12 << 4)

#define MAIN_VOLUME 7
#define ALL_NOTES_OFF 123

#define MIDI_CHANNEL 0

bool Flag_Preview;              // -n

int midfd;

void cleanup(int sig);
void silence(void);

int main(int argc, char *argv[])
{
    int ch;
    const char *midi_dev;
    uint8_t dur, note, prev_note, prev_prev_note, velo;
    int x = -121;

    while ((ch = getopt(argc, argv, "n")) != -1) {
        switch (ch) {
        case 'n':
            Flag_Preview = true;
            break;
        default:
            ;
        }
    }
    argc -= optind;
    argv += optind;

    if (!Flag_Preview) {
        if (argc == 0)
            midi_dev = "/dev/rmidi0";
        else
            midi_dev = *argv;

        if ((midfd = open(midi_dev, O_WRONLY | O_NONBLOCK)) == -1)
            err(EX_IOERR, "could not open MIDI device '%s'", midi_dev);

        // selects "Hands Kit" on my synth
        dprintf(midfd, "%c%c%c", CONTROL_CHANGE | MIDI_CHANNEL, 0, 63);
        dprintf(midfd, "%c%c%c", CONTROL_CHANGE | MIDI_CHANNEL, 32, 32);
        dprintf(midfd, "%c%c", PROGRAM_CHANGE | MIDI_CHANNEL, 41 - 1);

        dprintf(midfd, "%c%c%c", CONTROL_CHANGE | MIDI_CHANNEL, MAIN_VOLUME,
                100);

        signal(SIGINT, cleanup);
        signal(SIGTERM, cleanup);
        signal(SIGQUIT, cleanup);
    }

    prev_note = UINT8_MAX;
    prev_prev_note = UINT8_MAX - 1;
    while (true) {
        note = prev_note;
        while (note == prev_note && prev_prev_note != prev_note) {
            note = (uint8_t)
                lrint(sin((double) x) * cos(((double) x - 17) / 211) * 23.0 +
                      53);
            x++;
        }
        velo = (uint8_t) lrint(cos((double) x / 7.0) * 17 + 96);
        dur = (uint8_t) lrint(sqrt(pow(sin((double) x / 4.0) * 3, 1.1))) + 1;

        if (!Flag_Preview) {
            dprintf(midfd, "%c%c%c", NOTE_ON | MIDI_CHANNEL, note, velo);
            if (nanosleep(&(struct timespec) {0, 145991000 * dur}, NULL) == -1)
                err(EX_OSERR, "nanosleep() failed");
        }

        if (x == 4127) break;

        prev_prev_note = prev_note;
        prev_note = note;
        x++;
    }

    if (!Flag_Preview) {
        silence();
        sleep(2);
    }

    exit(EXIT_SUCCESS);
}

void cleanup(int sig)
{
    silence();
    exit(sig);
}

void silence(void)
{
    dprintf(midfd, "%c%c%c", CONTROL_CHANGE | MIDI_CHANNEL, ALL_NOTES_OFF, 0);
}
