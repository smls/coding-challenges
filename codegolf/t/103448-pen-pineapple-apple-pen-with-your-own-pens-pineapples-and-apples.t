#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.words.cache,
    thaw-out => *.subst('|', '', :g),
;

=finish

pen pineapple apple

|P-P-A-P
|
|I have a pen, I have an apple.
|Uh! Apple-Pen!
|
|I have a pen, I have a pineapple.
|Uh! Pineapple-Pen!
|
|Apple-Pen, Pineapple-Pen.
|Uh! Pen-Pineapple-Apple-Pen.
|Pen-Pineapple-Apple-Pen!
