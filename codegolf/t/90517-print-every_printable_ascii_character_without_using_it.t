#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

my @expected = ' ' .. '~';

golf-ok
    extract-code => *.lines.join(";\n"),
    code-constraint => {
          none map {.[0].contains: .[1]}, (.split(";\n") Z @expected)
    },
    test-cases => [ (Nil) => @expected ],
    thaw-result => *.lines.Array,
;
