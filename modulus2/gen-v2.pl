#!/usr/bin/perl
#                    VOICE 2 GEN
use strict;
use warnings;
use SharedMusic;

my $start_pitch = 96;

my @dur_counts;
my $note_number = 1;
my $next_note;
MM: for my $measure_num ( 1 .. $Measures ) {
  my $rp = 0;
  $rp = $measure_num % ( @Durs - 1 );
  $dur_counts[$rp]++;

  my $beat = 1;
  for my $dur ( @{ $Durs[$rp] } ) {
    my $n        = $start_pitch;
    my $register = q{'};

    $n += 1 if $beat == 3;
    $n += 1
      if $beat == 4
        and ( ( $dur_counts[$rp] % 4 == 1 and $measure_num > 2 )
          or $dur_counts[$rp] % 4 == 3 );
    $n -= 2 if $beat == 4 and $dur_counts[$rp] % 4 == 2;
    $n += 1 if $note_number % 9 == 4 and $note_number > 8;
    if ( $note_number > 32 ) {
      $n += 1 if $note_number % 4 == 3;
      $n += 1 if $beat == 3;
      $register = q{''} if $n < 96;
      $n -= 1 if $beat == 3 and $measure_num % 8 == 1;
      $n -= 2 if $beat == 3 and $measure_num % 16 == 10;
      $n += 3 if $beat == 7 and $measure_num % 8 == 2;
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
    $p = 'r' if $note_number == 1;       # second voice delayed intro
    $register = q{} if $p =~ m/^[rs]/;
    $p .= $register // '';
    $p .= $dur;
    $p .= '->' if $dur < 4;

    $p .= '\mf' if $note_number == 1;
    $p .= '\mp' if $beat == 1 and $measure_num == 6;
    $p .= '\mf' if $beat == 1 and $measure_num == 13;
    $p .= '\mp' if $beat == 1 and $measure_num == 20;
    $p .= '\mf' if $beat == 1 and $measure_num == 27;
    $p .= '\mp' if $beat == 1 and $measure_num == 34;
    $p .= '\mf' if $beat == 1 and $measure_num == 41;
    $p .= '\mp' if $beat == 1 and $measure_num == 48;
    $p .= '\mf' if $beat == 1 and $measure_num == 55;
    $p .= '\f'  if $beat == 1 and $measure_num == 61;

    print "\t$p";
    print "\t" if $dur == 4;

    $beat += increment_beat($dur);
    $note_number++;
  }
  print "\t|\n" unless $measure_num == $Measures;
}
print "\n";
