#!/usr/bin/env perl6

#-------------------------------.
# Tablesoccer team combinations | <http://redd.it/3s47m3> - with loop
#-------------------------------'

my @teams = $*IN.words.combinations(2);

for @teams.combinations(2) -> [@team1, @team2] {
    say "{@team1} VS {@team2}" unless any(@team1) eq any(@team2);
}
