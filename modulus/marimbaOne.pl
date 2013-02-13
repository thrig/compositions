#!/usr/bin/perl
my %map = qw/0 a 1 b 2 c 3 e 4 f/;

for my $i ( 1 .. 600 ) {
  my $n = 100;
  $n += 2 if $i % 4 == 0 and $i % 8 != 0;
  $n += 1 if $i % 7 == 0;
  $n -= 1 if $i % 8 == 0;
  $n -= 2 if $i % 7 == 0 and $i % 8 == 0;

  my $p = $map{ $n % keys %map };
  $p .= '8\f' if $i == 1;

  print "$p ";
  print "|\n  " if $i % 8 == 0;
}
