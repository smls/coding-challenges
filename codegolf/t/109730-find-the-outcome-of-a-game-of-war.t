#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-out => *.substr(0,1).Int,
    normalize-result => (+*).&{(-1 => 2){$_}//$_},
;

=finish
rg fr                -> 1  # P1 shot P2 while they were reloading
rg ff                -> 1  # They both shot, but only P1 had ammo
rr ff                -> 0  # Both had ammo and shot each other
rr ff rr fg          -> 0  # Everything after the first win is ingored
rr fg rf             -> 2  # P2 shot P1 while they were reloading
rf gg rr fg rr fr    -> 1
rr gf fr rf gg rg ff -> 1
gg rg gr gg gg rf fr -> 2
