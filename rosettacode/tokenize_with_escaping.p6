#!/usr/bin/env perl6

#---------------------------------.
# Tokenize a string with escaping |
#---------------------------------'

# For the task: https://rosettacode.org/wiki/Tokenize_a_string_with_escaping
# Language: Perl 6
# Author: Sam S <smls75@gmail.com>


sub tokenize ($string, :$sep!, :$esc!) {
    return $string.match(/([ <!before $sep | $esc> . | $esc . ]*)+ % $sep/)\
                  .[0].map(*.subst: /$esc )> ./, '', :g);
}

say "'$_'" for tokenize 'one^|uno||three^^^^|four^^^|^cuatro|', sep => '|', esc => '^';
