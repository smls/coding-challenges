#!/usr/bin/env perl6

#--------------------.
# Garage Door Opener | <http://redd.it/3sggs4>
#--------------------'

class GarageDoor {

    enum <Name                     onClick      onComplete  onBlock     Blockable>;
      
    my ($closed, $opening, $stop-open, $open, $closing, $stop-close, $emergency) =
      
         ("CLOSED"               , $opening   , Nil       , Nil       , True     ),
         ("OPENING"              , $stop-open , $open     , Nil       , True     ),
         ("STOPPED_WHILE_OPENING", $closing   , Nil       , Nil       , True     ),
         ("OPEN"                 , $closing   , Nil       , Nil       , True     ),
         ("CLOSING"              , $stop-close, $closed   , $emergency, True     ),
         ("STOPPED_WHILE_CLOSING", $opening   , Nil       , Nil       , True     ),
         ("EMERGENCY_OPENING"    , Nil        , $open     , Nil       , False    ),
    ;
    
    has $!state = $closed;
    has $!block;
    
    submethod BUILD { say "Door: CLOSED" }
    
    method button_clicked { self!transition: "Button clicked.", onClick          }
    method cycle_complete { self!transition: "Cycle complete.", onComplete       }
    method block_detected { self!transition: "Block detected!", onBlock, :block  }
    method block_cleared  { self!transition: "Block cleared.",           :!block }
   
    method !transition ($label, $input?, :$block) {
        $!state = $!state[$input] // $!state if $input and not self!blocking;
        $!block = $block if defined $block;
        say "> $label";
        say "Door: $!state[Name]" ~ ("_BLOCKED" if self!blocking);
    }
    method !blocking { $!block and $!state[Blockable] }
}



my $door = GarageDoor.new;

$door.button_clicked;
$door.block_detected;
$door.button_clicked;
$door.block_cleared;
$door.cycle_complete;
$door.button_clicked;
$door.block_detected;
$door.button_clicked;
$door.cycle_complete;
$door.button_clicked;
$door.block_cleared;
$door.button_clicked;
$door.block_detected;
$door.block_cleared;
$door.cycle_complete;

=finish

# my $door = GarageDoor.new;
# 
# $door."$_"() for lines;
# 