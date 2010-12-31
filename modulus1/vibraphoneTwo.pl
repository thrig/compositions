#!/usr/bin/perl
my %map = qw/0 a 1 b 2 c 3 e 4 f/;
my @notes;

for my $i ( 1 .. 400 ) {
  my $n = 97;
  $n -= 1 if $i % 7 == 0;
  $n += 1 if $i % 9 == 0;
  $n += 2 if $i % 3 == 0;

  my $p = $map{ $n % keys %map };
  $p .= '8\mp' if $i == 1;

  push @notes, $p;
  push @notes, 'r' if $i % 2 == 0;
}

for my $i ( 0 .. @notes ) {
  print "$notes[$i] ";
  print "|\n  " if $i % 8 == 7;
}
