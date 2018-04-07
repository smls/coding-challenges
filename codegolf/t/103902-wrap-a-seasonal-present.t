#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => { \((thaw $_), ".") },
    thaw-out => &thaw,
;

sub thaw ($string) { [[[.words] for .lines] for split /\n '-'* \n/, $string] }
sub freeze (@array) {
    my $sep = '-' x @array[0][0].gist.chars;
    say $sep;
    for @array -> @layer {
        say .gist for @layer;
        say $sep;
    }
}

# ->\a,\w{my @z=[[w xx a[0;0]+2]xx a[0]+2]xx a+2;@z[1..a;1..a[0];1..a[0;0]]=a[*;*;*];@z}
# {my @z=[[$^w xx@^a[0;0]+2]xx@a[0]+2]xx@a+2;@z[$_+1;1..@a[0];1..@a[0;0]]=@a[$_;*;*] for ^@a;@z}

=finish
1 2
3 4
---
5 6
7 8

. . . .
. . . .
. . . .
. . . .
-------
. . . .
. 1 2 .
. 3 4 .
. . . .
-------
. . . .
. 5 6 .
. 7 8 .
. . . .
-------
. . . .
. . . .
. . . .
. . . .

Y o u r 
G i f t

. . . . . . 
. . . . . . 
. . . . . . 
. . . . . . 
-----------
. . . . . . 
. Y o u r . 
. G i f t . 
. . . . . . 
-----------
. . . . . . 
. . . . . . 
. . . . . . 
. . . . . .
