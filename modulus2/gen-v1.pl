#!/usr/bin/perl
#                    VOICE 1 GEN
use strict;
use warnings;
use SharedMusic;

my $start_pitch = 98;

my @dur_counts;
my $note_number = 1;
my $next_note;
MM: for my $measure_num ( 1 .. $Measures ) {
  my $rp = 0;
  $rp = $measure_num % @Durs;
  $dur_counts[$rp]++;

  my $beat = 1;
  for my $dur ( @{ $Durs[$rp] } ) {
    my $n        = $start_pitch;
    my $register = q{'};

    $n -= 1 if $beat == 2            and $dur_counts[$rp] % 4 == 1;
    $n -= 1 if $beat == 3            and $measure_num % 4 == 2;
    $n -= 1 if $beat == 4            and $dur_counts[$rp] % 4 == 3;
    $n -= 1 if $note_number % 7 == 3 and $note_number > 8;
    $n += 1 if $beat == 7 and $measure_num & 1;
    if ( $note_number > 32 ) {
      $n -= 1 if $note_number % 4 == 1;
      $n -= 2 if $beat == 4;
      $register = q{''} if $n < 96;
    }

    my $p = $Num2Note{ $n % keys %Num2Note };
    #warn "DBG note $p on beat $beat of MM $measure_num\n";
    if ( defined $next_note ) {
      $p = $next_note;
      undef $next_note;
    } elsif ( $p eq 'ces' ) {
      $next_note = 'bes';
    } elsif ( $p eq 'bes' and $register eq q{''} ) {
      $p         = 'e';
      $next_note = 'bes';
    }
    $register = q{} if $p =~ m/^[rs]/;
    $p .= $register // '';
    $p .= $dur;
    $p .= '->' if $dur < 4;

    $p .= '\mf' if $note_number == 1;
    $p .= '\mp' if $beat == 1 and $measure_num == 6;
    $p .= '\mf' if $beat == 1 and $measure_num == 14;
    $p .= '\mp' if $beat == 1 and $measure_num == 22;
    $p .= '\mf' if $beat == 1 and $measure_num == 30;
    $p .= '\mp' if $beat == 1 and $measure_num == 38;
    $p .= '\mf' if $beat == 1 and $measure_num == 46;
    $p .= '\mp' if $beat == 1 and $measure_num == 54;
    $p .= '\mf' if $beat == 1 and $measure_num == 58;
    $p .= '\f'  if $beat == 1 and $measure_num == 61;

    print "\t$p";
    print "\t" if $dur == 4;

    $beat += increment_beat($dur);
    $note_number++;
  }
  print "\t|\n" unless $measure_num == $Measures;
}
print "\n";
