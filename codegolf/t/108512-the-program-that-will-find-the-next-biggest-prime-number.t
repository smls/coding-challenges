#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.Int,
    thaw-out => *.Int,
;

=finish
2 -> 3
5749 -> 5779
