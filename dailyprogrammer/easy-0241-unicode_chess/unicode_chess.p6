#!/usr/bin/env perl6

#---------------.
# Unicode Chess | <http://redd.it/3t0xdw>
#---------------'

class ChessBoard {    
    has @!board;
    
    submethod BUILD (:$FEN) {
        @!board = ([+$_ ?? |('.' xx $_) !! $_ for .comb] for $FEN.split: '/').reverse;
    }
    
    method display {
        constant %uni = hash <s r n b q k p g S R N B Q K P G>
                         Z=> <♜ ♜ ♞ ♝ ♛ ♚ ♟ ☼ ♖ ♖ ♘ ♗ ♕ ♔ ♙ ☼>;
        for 7...0 -> $i {
            say $i+1, (%uni{@!board[$i; $_]} // <☐ ☒>[($i + $_) % 2] for ^8).join;
        }
        say " abcdefgh";
    }
    
    method make-move ($move) {
        my token pos { (<[a..h]>) (<[1..8]>) }

        $move ~~ /(<pos> <[x-]> <pos>) ' '+ (<pos> <[x-]> <pos>)/
            or die "Invalid move '$move'";

        for $0, $1 {
            my ($x1, $y1, $x2, $y2) = .<pos>.map({ .[1]-1, .[0].ord-97 }).flat;
            @!board[$x2; $y2] = @!board[$x1; $y1];
            @!board[$x1; $y1] = '.';
        }
    }
}


my $board = ChessBoard.new(FEN => "snbqkbns/pppppppp/8/8/8/8/PPPPPPPP/SNBQKBNS");

$board.display;

for "e2-e4 c7-c5", "f1-c4 g8-f6", "c4xf7 e8xf7", "e4-e5 d7-d5" -> $move {
    say "\n> $move\n";
    $board.make-move($move);
    $board.display;
}
