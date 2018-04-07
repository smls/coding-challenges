#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.match(/'"' <( .*? )> '"'/).Str,
    thaw-out => *.match(/'"' <( .*? )> '"'/).Str,
;

# {[.comb].&{my &c={.Bag.&{|.<c o w b e>,.<l>div 2}.min}
# [~] first *.&c>$/,(($_,)X [\,]($_))»[*;*]}}

=finish
"christopher walken begs for more cowbell!" -> "christopher walken begs for more cowbell!christopher wal"
"the quick brown fox jumps over the lazy dog" -> "the quick brown fox jumps over the lazy dogthe quick brown fox jumps over the l"
"cowbell" -> "cowbellcowbell"
"cowbell cowbell cowbell" -> "cowbell cowbell cowbellcowbell"
"cowbell cowbell cowbel" -> "cowbell cowbell cowbelcowbel"
"bcelow" -> "bcelowbcel"
"abcdefghijklmnopqrstuvwxyz" -> "abcdefghijklmnopqrstuvwxyzabcdefghijkl"
"cccowwwwbbeeeeelllll" -> "cccowwwwbbeeeeelllllccco"
"be well, programming puzzles & code golf" -> "be well, programming puzzles & code golfbe well, programming puzzles & c"
"lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. wow!" -> "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. wow!lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut lab"
