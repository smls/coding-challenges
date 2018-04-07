#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Numeric,
    thaw-out => *.Numeric,
;

=finish
         -4 -> 0
         -1 -> 0
          0 -> 0
          1 -> 1
          2 -> 1
     1.0001 -> 0.000100
 678.123456 -> 0.123456
-678.123456 -> 0.876544
        4.5 -> 0.5
