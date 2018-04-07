#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.Int,
    thaw-out => *.split(' or ').any,
;

=finish
1 -> 1
2 -> -2
3 -> 1-3
4 -> 1--4 or -2-4
10 -> 1-3-5-7-10
11 -> 1-3-5-7--11 or 1-3-5--8-11 or 1-3--6-8-11 or 1--4-6-8-11 or -2-4-6-8-11
