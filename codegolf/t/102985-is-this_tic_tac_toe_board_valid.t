#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.words.rotor(3).List,
    thaw-out => {$_ eq "True"},
;

=finish
X O X
O X O
X O X

True

X O X
X O X
O X O

True

X O O
O O X
O X X

True

O X O
X O X
O X O

True

O O O
X O X
X O X

True

X X X
X X X
X X X

False

O O O
O O O
O O O

False

X X X
O O O
X X X

False

O O O
O O X
X X X

False

X X O
O X O
O O X

False
