#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.split(',')».Rat.Capture,
;

=finish
80, 1   -> Overweight
80, 2   -> Normal
80, 3   -> Underweight
50, 1   -> Overweight
50, 1.5 -> Normal
50, 2   -> Underweight
