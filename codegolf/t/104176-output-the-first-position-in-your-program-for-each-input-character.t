#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

my $code = $*PROGRAM.basename.subst(/.t $/, ".function.p6");

my %x is default(Nil) = reverse 'src'.IO.child($code).comb Z=> 0..*;

golf-ok
    test-cases => do for (" ".."~").rotor(1..*) -> @in {
          @in => %x{@in};
    }
;
