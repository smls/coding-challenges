#!/usr/bin/env perl6

#--------------.
# Typoglycemia | <http://redd.it/3s4nyq>
#--------------'

# This version guarantees that the scrambled words end up different from the
# originals.

say slurp.subst: /(<:letter>) (<:letter+[']> ** 2..*) (<:letter>)/, :g, {
    $0 ~ ($1.comb.pick(*).join xx *).first(* ne $1) ~ $2
}
