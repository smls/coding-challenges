#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

my @data is default(False);
@data[$_] = True for $=finish.lines;

golf-ok
    test-cases => @data\  # Pick a small selection of test cases
        .grep(?*, :k).[0, 2 ... 6]\
        .map({ @data.pairs[($_-1 if $_), $_, $_+1] }).flat
;

=finish
0
11
31
51
71
91
111
131
151
171
191
192
194
197
200
203
206
209
212
215
218
222
252
282
312
