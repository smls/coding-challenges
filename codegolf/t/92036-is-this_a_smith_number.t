#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    split-data => *.lines».split(": "),
    thaw-in    => *.Int,
    thaw-out   => * eq 'True',
;

=finish
18: False
22: True
13: False
666: True
-265: False
0: False
1: False
4937775: True
