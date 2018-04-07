#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok 1,
    thaw-in => *.words.cache,
    thaw-out => *.words.cache,
;

golf-ok 2;

=finish
The quick brown fox jumps over the lazy dog.

Teh d.ogq kucil yaz bnrwo tehf xoo rvej supm

The quick brown fox jumps
over the lazy dog.

Teh d.ogq kucil yaz bnrwo
tehf xoo rvej supm

Aflack

Akfcla
