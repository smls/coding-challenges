#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
    thaw-out => *.Int,
;

=finish
   1 ->   1
   2 ->   2
  10 ->  10
  11 ->   1
  29 ->   9
  30 ->  30
  99 ->   9
 100 -> 100
 119 ->   9
 120 ->  20
 200 -> 200
 409 ->   9
1020 ->  20
