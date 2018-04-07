#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-out => {?/True/},
;

=finish
The man in the suit
is the same man from the store.
He is a cool guy.

True

Whitecaps on the bay:
A broken signboard banging
In the April wind.

False
