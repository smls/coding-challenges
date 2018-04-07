#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.words.List,
    thaw-result => *.&{ S:g/^^ $(min m:g/^^ " "+/)// },
;

=finish
aaa aaa aab baa

Aaa
Aaa
Baa

live every love very ohio

Live
Ohio
Very
Every

cow of fox

cOw
 Fox

late ballroom anvil to head

baLlroom
  Anvil
  To
 hEad
