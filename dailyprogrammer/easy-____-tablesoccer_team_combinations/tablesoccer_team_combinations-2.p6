#!/usr/bin/env perl6

#-------------------------------.
# Tablesoccer team combinations | <http://redd.it/3s47m3> - as single statement
#-------------------------------'

.say for
    $*IN.words
    .combinations(2)
    .combinations(2)
    .grep(*.flat.unique == 4)
    .map(*.join: " VS ");
