#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-out => *.comb(/ \d+ /)».Int,
;

=finish
4..6   ->  4096, 4356
1..1   ->  1521, 1681
1..    ->  100, 121, 144, 169, 196
9....9 ->  908209, 915849, 927369, 935089, 946729, 954529, 966289, 974169, 986049, 994009
9.9... ->  919681, 929296
1..0.  ->  10000, 10201, 10404, 10609, 12100, 14400, 16900, 19600
9...4  ->  91204, 94864, 97344
