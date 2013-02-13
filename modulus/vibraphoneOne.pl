#!/usr/bin/perl
my %map = qw/0 a 1 b 2 c 3 e 4 f/;

for my $i ( 1 .. 300 ) {
  my $n = 98;
  $n += 1 if $i % 3 == 0;
  $n -= 2 if $i % 4 == 0;
  $n += 3 if $i % 5 == 0;

  my $p = $map{ $n % keys %map };
  $p .= '8\mp' if $i == 1;

  print $p, " r ";
  print "|\n  " if $i % 4 == 0;
}
