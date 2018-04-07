#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    :run-from-file,
    test-cases => [ map (Nil) => *.Str, <1 2 3 5 8> ],
;
