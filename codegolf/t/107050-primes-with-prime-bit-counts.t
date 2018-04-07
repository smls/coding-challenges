#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

use MONKEY-SEE-NO-EVAL;

golf-ok
    thaw-in  => *.EVAL,
    thaw-out => *.EVAL,
;

=finish
10  -> ()
100 -> (17, 19, 37, 41, 79)
150 -> (17, 19, 37, 41, 79, 103, 107, 109, 131, 137)
