#!/usr/bin/env perl

#---------------------------------.
# Tokenize a string with escaping |
#---------------------------------'

# For the task: https://rosettacode.org/wiki/Tokenize_a_string_with_escaping
# Language: Perl
# Author: Sam S <smls75@gmail.com>


sub tokenize {
    my ($string, $sep, $esc) = (shift, quotemeta shift, quotemeta shift);
    
    my @fields = $string =~ /\G (?:^ | $sep) \K (?: [^$sep$esc] | $esc.)*/gsx;
    return map { s/$esc(.)/$1/gsr } @fields;
}

sub tokenize2 {
    my ($string, $sep, $esc) = (shift, quotemeta shift, quotemeta shift);
    my @fields = split /$esc . (*SKIP)(*FAIL) | $sep/sx, $string, -1;
    return map { s/$esc(.)/$1/gsr } @fields;
}


print "'$_'\n" for tokenize("one^|uno||three^^^^|four^^^|^cuatro|", '|', '^');

print "'$_'\n" for tokenize2("one^|uno||three^^^^|four^^^|^cuatro|", '|', '^');
