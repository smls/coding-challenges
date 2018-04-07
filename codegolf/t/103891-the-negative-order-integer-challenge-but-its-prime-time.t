#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
    thaw-out => *.Str,
;

=finish
1  -> 1
7  -> 121321532175321
23 -> 1213215321753211175321131175321171311753211917131175321231917131175321
