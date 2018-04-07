#!/usr/bin/env perl6

#---------------------------.
# Ggggggg gggg Ggggg-ggggg! | <http://redd.it/3x3hqa> - decoding
#---------------------------'

my %key = get.split(' ').reverse;
my @letters = %key.keys;

for lines() {
  say .subst: /@letters/, { %key{$_} }, :g
}


=finish

# Exhaustive version

for lines() {
    for .match(/^ (@letters | <-[gG]>)+ $/, :ex) {
        say .[0].map({ %key{$_} // $_ }).join;
    }
}
