#!/usr/bin/perl
#                    VOICE 3 GEN
use strict;
use warnings;
use SharedMusic;

my $voice_num   = 3;
my $max_voice   = 4;
my $start_pitch = 2;

my $spin = 1;

my @dur_counts;
my $note_number = 1;
MM: for my $measure_num ( 1 .. $Measures ) {
  my @notes;
  my $rp = 0;
  $rp = ( $measure_num % @Durs - $voice_num ) % @Durs;
  $dur_counts[$rp]++;

  $start_pitch+=1 if $measure_num % 12 == 0 and $measure_num > 10;

  my $beat = 1;
  my $dc = 0;
  for my $dur ( @{ $Durs[$rp] } ) {
    my $n        = $start_pitch;
    my $register = q{'};

    if ( $measure_num > $voice_num + 1 ) {
      $n = $voice_num + $max_voice*$spin
        if $beat > 20 and $measure_num % $max_voice == $voice_num;
      $n = $voice_num + ($max_voice - 1)*$spin
        if $beat > 21 and $measure_num % $max_voice == $voice_num;
      $n = $voice_num - 1*$spin
        if $beat > 22 and $measure_num % $max_voice == $voice_num;
    }

    my $p = $Num2Note{ $n % keys %Num2Note };
    $p = 'r'
      if $measure_num < $voice_num
        or ( $measure_num == $voice_num and $beat < 24 );
    warn "DBG note $p$dur on beat $beat of MM $measure_num\n";
    $register = q{''} if $n > 7;

    push @notes,
      {
      register    => $register,
      note        => $p,
      value       => $n,
      duration    => $dur,
      beat        => $beat,
      note_number => $note_number
      };
    $notes[-1]->{volume} = '\mp' if $note_number == 1;

    $beat += increment_beat($dur);
    $note_number++;
    $dc++;
  }

  reduce_rests( \@notes );
  print_measure( \@notes, $measure_num );
}
print "\n";
