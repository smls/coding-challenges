#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.Int,
    thaw-out => *.Str,
;

=finish
6 -> 121321432154321654321
1 -> 1
26 -> 121321432154321654321765432187654321987654321109876543211110987654321121110987654321131211109876543211413121110987654321151413121110987654321161514131211109876543211716151413121110987654321181716151413121110987654321191817161514131211109876543212019181716151413121110987654321212019181716151413121110987654321222120191817161514131211109876543212322212019181716151413121110987654321242322212019181716151413121110987654321252423222120191817161514131211109876543212625242322212019181716151413121110987654321
0 -> 
21 -> 121321432154321654321765432187654321987654321109876543211110987654321121110987654321131211109876543211413121110987654321151413121110987654321161514131211109876543211716151413121110987654321181716151413121110987654321191817161514131211109876543212019181716151413121110987654321212019181716151413121110987654321