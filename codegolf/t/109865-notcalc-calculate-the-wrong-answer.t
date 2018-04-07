#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    test-cases => $=finish.chomp.lines.map: {
          my @in = .split(' ')».Int;
          @in.Capture => {
                my $n = .Numeric.narrow;
                $n ~~ Int and $n >= 0 and $n != @in.sum;
          }
    }
;

=finish
0 0
1 0
0 1
1 1
2 1
1 2
2 2
99 0
99 1
99 99
