#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.split(', ')».&val.Capture,
;

=finish
codegolf, 1.25     -> codegolf))))))))))
codegolf, 0.75     -> codegolf))))))
noob team omg, 0.5 -> noob team omg))))))
hi!, 4.99          -> hi!))))))))))))))
