#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in  => *.match(/'"' <( .* )> '"'/).Str,
    thaw-out => *.match(/'"' <( .* )> '"'/).Str,
;

=finish
"abcdefghijkl"               -> "abgjkl hfedcgi "
"abcdefghijklm"              -> "abgjklmhfedcgi "
"abcdefghijklmn"             -> "abgjklmhfedcgin"
"abcdefghijklmno"            -> "abgjklmhfedcgino              "
"abcdefghijklmnop"           -> "abgjklmhfedcginop             "
"abcdefghijklmnopq"          -> "abgjklmhfedcginop         q   "
"abcdefghijklmnopqr"         -> "abgjklmhfedcginop        rq   "
"abcdefghijklmnopqrs"        -> "abgjklmhfedcginop       srq   "
"abcdefghijklmnopqrst"       -> "abgjklmhfedcginop      tsrq   "
"abcdefghijklmnopqrstu"      -> "abgjklmhfedcginopu     tsrqu  "
"abcdefghijklmnopqrstuv"     -> "abgjklmhfedcginopu    vtsrqu  "
"abcdefghijklmnopqrstuvw"    -> "abgjklmhfedcginopu    vtsrquw "
"abcdefghijklmnopqrstuvwx"   -> "abgjklmhfedcginopux   vtsrquw "
"abcdefghijklmnopqrstuvwxy"  -> "abgjklmhfedcginopuxy  vtsrquw "
"abcdefghijklmnopqrstuvwxyz" -> "abgjklmhfedcginopuxyz vtsrquw "
"!@#"                        -> "!@         #   "
"12345 67890"                -> "12690  7 54368 "
" "                          -> "               "
""                           -> ""
