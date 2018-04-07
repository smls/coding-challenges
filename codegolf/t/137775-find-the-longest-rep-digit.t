#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Numeric,
    thaw-out => *.Numeric,
;

=finish
1    -> 1
2    -> 1
3    -> 2
4    -> 2
5    -> 2
6    -> 2
7    -> 3
8    -> 2
9    -> 2
10   -> 2
11   -> 2
26   -> 3
63   -> 6
1023 -> 10
