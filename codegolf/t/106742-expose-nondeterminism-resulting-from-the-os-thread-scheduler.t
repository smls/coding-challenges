#!/usr/bin/env perl6
use lib 'lib';
use Test;
use Test::Golf;

golf-ok
    test-cases => [ ((Nil) => &check-result) xx 10 ],
    skip => "No longer works with newer versions of Rakudo.",
;

sub check-result ($result) {
    push state @result, $result;
    
    if $result.lines».Int.sort !~~ (0..99).list {
        diag "Wrong output: {$result.perl}";
        False;
    }
    elsif $result eq any(@result[0..*-2]) {
        diag "Insufficient nondeterminism";
        False;
    }
    else { True }
}
