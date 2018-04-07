#!/usr/bin/env perl6

#---------------.
# Letter Splits | <http://redd.it/3wwjum> - using an exhaustive regex
#---------------'

for get.match(/^ (<[1..9]> | 1 <[0..9]> | 2 <[0..6]>)+ $/, :exhaustive) {
    say .[0].map(* + 64)».chr.join;
}
