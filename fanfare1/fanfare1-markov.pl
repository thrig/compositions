#!/usr/bin/perl
#
# Generates variations on theme from Jeremiah Clarke's (c.1674-1707): "The
# Prince of Denmark's March" and Jean-Joseph Mouret's Rondeau:
#
# http://imslp.org/wiki/index.html?curid=32036
# http://imslp.org/wiki/Fanfares_%28Mouret,_Jean-Joseph%29
#
# Markov code derived from chapter 9 of "Musimathics, volume 1". Writes
# a result-$epoch.midi file with the results, or dies if something goes
# awry. Notable things to fiddle with:
#
# - @melody, below - perhaps use less of phrases 1, 2, etc.
# - $rhythm_ref, below
# - starting note, ending note regex (ARGV)
#
# Decent sounding results are tweaked for rhythm and to taste, and
# either accepted or more often thrown out until something suitable
# is found.

use strict;
use warnings;
use feature qw(say);

use List::Util qw(sum);
use MIDI::Simple;

# First phrase I -> V (statement)
my @p1 = qw(
  D5 E5
  Fsharp5 G5 Fsharp5 E5
  D5 E5 Fsharp5 E5
  E5 A4
);

# Second phrase I -> I (consequent)
my @p2 = qw(
  D5 E5
  Fsharp5 G5 Fsharp5 E5
  D5 D5 E5 D5
  D5
);

# Third phrase III -> V -> I with sharpened IV (extension)
my @p3 = qw(
  Fsharp5 Gsharp5
  A5 B5 A5 G5
  Fsharp5 D5 D5 A4
  D5 A4 Fsharp4 D4
);

# Fourth phrase III -> V -> V/V with V underneath (extension)
my @p4 = qw(
  Fsharp5 Gsharp5
  A5 B5 A5 G5
  Fsharp5 E4 D5 Fsharp5
  E5
);

# Fifth phrase V -> I -> V -> V/V -> V (extension)
my @p5 = qw(
  A4 Fsharp4 A4 D5
  A4 Fsharp4 A4 D5
  A4 D5 Fsharp5 D5
  Csharp5 B4 A4
);

# 6th phrase V/V -> V (extension)
my @p6 = qw(
  E5 Csharp5 E5 Fsharp5
  E5 Csharp5 E5 Fsharp5
  E5 D5 B4 A4
  A4
);

my @mouret_fanfare = qw(
  Fsharp5 D5 A4 D5 E5 Fsharp5 Fsharp5 D5 Fsharp5 A5 A5 A5 B5 A5 G5 Fsharp5 Fsharp5 A5 D6 A5 A5 Fsharp5 E5 G5 Fsharp5 E5 A4 E5 E5 E5 E5 E5
  Fsharp5 D5 A4 D5 E5 Fsharp5 Fsharp5 D5 Fsharp5 A5 A5 A5 B5 A5 G5 Fsharp5 Fsharp5 A5 D6 A5 A5 Fsharp5 E5 G5 Fsharp5 E5 A4 E5 D5 D5 D5 D5
  Fsharp4 A4 A4 A4 A4 Fsharp4 D4 D5 D5 Fsharp5 E5 G5 E5 E5 Csharp5 A4 Fsharp4 A4 A4 A4 A4 Fsharp4 D4 D5 D5 Fsharp5 E5 G5 E5 A5
  Fsharp5 D5 A4 D5 E5 Fsharp5 Fsharp5 D5 Fsharp5 A5 A5 A5 B5 A5 G5 Fsharp5 Fsharp5 A5 D6 A5 A5 Fsharp5 E5 G5 Fsharp5 E5 A4 E5 D5 D5 D5 D5
  A5 B5 B5 B5 B5 G5 G5 G5 G5 A5 A5 A5 A5 A5 Fsharp5 B5 A5 G5 G5 Dsharp5 E5 Fsharp5 B4 B5 A5 G5 G5 G5 A5 Fsharp5 E5 B5 B5 B5 C6 B5 C6 D6 B5 Gsharp5 Gsharp5 Gsharp5 A5 E5 E5 A5 Gsharp5 B5 B5 B5 C6 B5 C6 D6 B5 B5 D6 E6 C6 B5 B5 A5 A5 E5 G5 G5 Fsharp5 Fsharp5 A5 A5 D5 G5 B5 B5 E5 A5 G5 E5 Csharp5 E5 A4
);

my @rrs = (
  [ ('hn') x 2, ('qn') x 9, 'dhn' ],    # 0  first phrase
  [ ('hn') x 2, ('qn') x 8, 'wn' ],     # 1  second phrase
  [ ('hn') x 2, ('qn') x 12 ],          # 2  3rd phrase
  [ ('hn') x 2, ('qn') x 8, 'wn' ],     # 3  4th phrase
  [ ('qn') x 14, 'hn' ],                # 4  5th phrase
  [ ('qn') x 12, 'wn' ],                # 5  6th phrase
  [ ('qn') x 10, 'hn' ], # DBG
);
my $rhythm_ref;
push @$rhythm_ref, @{ $rrs[2] }, @{ $rrs[3] };
#push @$rhythm_ref, @{ $rrs[-1] };
my $middle_note_index = $#{$rrs[2]};

my @melody = (
  @p1, @p2, @p1, @p2, @p3, @p4, @p3, @p4, @p1, @p1,
  @p1, @p2, @p5, @p6, @p5, @p6, @p1, @p2, @p1, @p2,
  @mouret_fanfare
);

########################################################################
#
# Main

my %note_choices;
for my $i ( 0 .. $#melody ) {
  $note_choices{ $melody[ $i - 1 ] }->{ $melody[$i] }++;
}
normalize_choices( \%note_choices );

# Optional note to start with, optional regex to constrain what the
# last note will be (so if want a phrase from I to V can invoke this
# program as:
#   ./horn1-markov.pl D5 '^A'
my $first_note = shift // $melody[0];
my $last_note   = shift || qr/^/;
my $middle_note = shift || qr/^/;
my ( @melody_out, $current_note, $tries );

TRY_AGAIN:
@melody_out   = ();
$current_note = $first_note;

for my $element (@$rhythm_ref) {
  if ( $element =~ m/R$/ ) {
    $element =~ s/R$//;
    push @melody_out, { duration => $element, note => 'rest' };
  } else {
    push @melody_out, { duration => $element, note => $current_note };
    $current_note = choose_next( $note_choices{$current_note} );
  }
}

if ( $melody_out[-1]{'note'} !~ /$last_note/
  or $melody_out[$middle_note_index]{'note'} !~ /$middle_note/ ) {
  if ( ++$tries > 10000 ) {
    die "error: could not generate melody in $tries tries\n";
  }
  say "info: some note of melody not appropriate, trying again ($tries)";
  goto TRY_AGAIN;
}

melody_to_midi( \@melody_out );

exit 0;

########################################################################
#
# SUBROUTINES

sub melody_to_midi {
  my $melody_ref = shift;

  new_score;
  set_tempo 500_000;
  # PC# - http://www.midi.org/techspecs/gm1sound.php
  patch_change 1, 57;    # 57 trumpet or 70 english horn

  noop( 'c1', 'mp', 'o6' );

  for my $element_ref (@$melody_ref) {
    n $element_ref->{duration}, $element_ref->{note};
  }

  write_score 'result-' . time . '.midi';
}

sub generate {
  my $choice_ref     = shift;
  my $iterations     = shift;
  my $current_choice = shift;

  if ( !defined $current_choice ) {
    $current_choice = ( keys %$choice_ref )[ rand keys %$choice_ref ];
  } elsif ( !exists $choice_ref->{$current_choice} ) {
    die "no such choice exists: $current_choice";
  }

  my @output = $current_choice;

  for my $i ( 2 .. $iterations ) {
    push @output, choose_next( $choice_ref->{ $output[-1] } );
  }

  return \@output;
}

sub choose_next {
  my $target_ref = shift;
  my $rand       = rand;
  my $choice;

  for my $target (
    sort { $target_ref->{$b} <=> $target_ref->{$a} }
    keys %$target_ref
    ) {
    $choice = $target if $target_ref->{$target} >= $rand;
  }

  return $choice;
}

# Fixup odds in the supplied hash of hashes reference to be cumulative,
# prune any dead ends. Alters the reference in-place.
sub normalize_choices {
  my $choice_ref = shift;

  for my $choice ( keys %$choice_ref ) {
    # First prune out any dead ends (TODO different context for the
    # "end" or other portions of a work, where one could allow the dead
    # end choice? Or loop the final element back to the first element?)
    for my $target ( keys %{ $choice_ref->{$choice} } ) {
      if ( !exists $choice_ref->{$target} ) {
        delete $choice_ref->{$choice}->{$target};
      }
    }

    # Normalize the odds and make cumulative from 0 to 1
    my $target_sum = sum values %{ $choice_ref->{$choice} };
    my $factor = ( $target_sum != 1 ) ? 1 / $target_sum : 1;

    my $running_total = 0;
    for my $target_value ( values %{ $choice_ref->{$choice} } ) {
      $target_value  = $target_value * $factor + $running_total;
      $running_total = $target_value;
    }
  }

  return 1;
}
