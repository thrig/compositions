#!/usr/bin/perl
my %map = qw/0 a 1 b 2 c 3 e 4 f/;

for my $i ( 1 .. 600 ) {
  my $n = 99;
  $n -= 1 if $i % 2 == 0 and $i % 3 != 0;
  $n += 1 if $i % 3 == 0 and $i % 2 != 0;

  my $p = $map{ $n % keys %map };
  $p .= '8\f' if $i == 1;

  print "$p ";
  print "|\n  " if $i % 8 == 0;
}
