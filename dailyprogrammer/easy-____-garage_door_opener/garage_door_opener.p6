#!/usr/bin/env perl6

#--------------------.
# Garage Door Opener | <http://redd.it/3sggs4>
#--------------------'

class GarageDoor {
    
    enum                         <Click                 Complete>;
    my %states =
        CLOSED                => <OPENING                       >,
        OPENING               => <STOPPED_WHILE_OPENING OPEN    >,
        STOPPED_WHILE_OPENING => <CLOSING                       >,
        OPEN                  => <CLOSING                       >,
        CLOSING               => <STOPPED_WHILE_CLOSING CLOSED  >,
        STOPPED_WHILE_CLOSING => <OPENING                       >,
    ;
    
    has $!state = 'CLOSED';
    
    submethod BUILD { say "Door: CLOSED" }

    method button_clicked { self!transition: Click,    "Button clicked." }
    method cycle_complete { self!transition: Complete, "Cycle complete." }
    
    method !transition ($input, $label) {
        $!state = %states{$!state}[$input] // $!state;
        say "> $label";
        say "Door: $!state";
    }
}


# my $door = GarageDoor.new;
# 
# $door.button_clicked;
# $door.cycle_complete;
# $door.button_clicked;
# $door.button_clicked;
# $door.button_clicked;
# $door.button_clicked;
# $door.button_clicked;
# $door.cycle_complete;


my $door = GarageDoor.new;

$door."$_"() for lines;
