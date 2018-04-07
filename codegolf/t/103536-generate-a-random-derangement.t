#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok test-cases => [
    <a b> => <b a>,
    |((<a b c d> => any <a b c d>.permutations.grep({
      .[0] ne 'a' and
      .[1] ne 'b' and
      .[2] ne 'c' and
      .[3] ne 'd'
})) xx 10)];
