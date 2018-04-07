#!/usr/bin/env perl6

#--------------.
# Typoglycemia | <http://redd.it/3s4nyq>
#--------------'

say slurp.subst: /(<:letter>) (<:letter+[']> +) (<:letter>)/, :g, {
    $0 ~ $1.comb.pick(*).join ~ $2
}
