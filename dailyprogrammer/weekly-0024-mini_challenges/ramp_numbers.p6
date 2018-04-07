#!/usr/bin/env perl6

#------------------------------.
# Mini Challenge: Ramp Numbers | <http://redd.it/3o4tpz>
#------------------------------'

say (1..get).grep({ [<=] .comb }).elems;
