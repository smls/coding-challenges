#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.words.&{ .[0].Int, .[1], .[2].Int, .[3].Int }.Capture,
;

=finish
1 < 10 1

1
2
3
4
5
6
7
8
9


10 > 5 -2

10
8
6
