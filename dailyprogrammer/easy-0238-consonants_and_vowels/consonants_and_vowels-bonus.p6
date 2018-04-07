#!/usr/bin/env perl6

#-----------------------.
# Consonants and Vowels | <http://redd.it/3q9vpn> - incl. bonus challenge
#-----------------------'

# Also programmatically generates the list of consonants to ensure there are no
# typos.


constant vowels = <a e i o u>;
constant consonants = ("a".."z") (-) vowels;

say get.trans:
    "v" => { vowels.pick },
    "V" => { vowels.pick.uc },
    "c" => { consonants.pick },
    "C" => { consonants.pick.uc },
    /./ => { note "Only v V c C are allowed in the input string."; exit 1 },
;
