#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok test-cases => [
    "programming puzzles & code golf" =>
    ("pr{.[0]}gr{.[1]}mm{.[2]}ng p{.[3]}zzl{.[4]}s & c{.[5]}d{.[6]} g{.[7]}lf"
        for <o a i u e o e o>.permutations).any
];
