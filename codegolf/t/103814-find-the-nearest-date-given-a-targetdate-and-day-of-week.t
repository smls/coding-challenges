#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.words.map({
        $^date,
        <Sun Mon Tue Wed Thu Fri Sat>.first($^wd, :k) + 1
    })[0].Capture,
;

=finish
20161219 Fri -> 20161216
20161219 Wed -> 20161221
20161219 Mon -> 20161219
