#!/usr/bin/env perl6

#-----------------------.
# Consonants and Vowels | <http://redd.it/3q9vpn>
#-----------------------'

say get.lc.trans:
    "v" => { <a e i o u>.pick },
    "c" => { <b c d f g h j k l m n p q r s t v w x y z>.pick };
