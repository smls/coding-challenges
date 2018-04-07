#!/usr/bin/env perl6

#------------------------------------------.
# Turn any language into an Array language | <http://redd.it/3vswuc>
#------------------------------------------'

our $i = 0;

#---------------- The 'is arrayfunction' trait ----------------#

multi trait_mod:<is>(&fn as Routine, :arrayfunction([$rank-y, $rank-x])!) {
    &fn.wrap: sub (|c ($y, $x?)) {
        say "{' ' x $i*2}{&fn.name}* {$y.gist}, {$x.gist}";
        say "{' ' x $i*2}  CMP {rank($y)}<=>{$rank-y}, {rank($x)}<=>{$rank-x}";
        $i++;
        my \r = do given (rank($y) <=> $rank-y), (rank($x) <=> $rank-x) {
            when (More, More) { say "{' ' x $i*2}ZIP";
                                die "Size mismatch" if $y.elems ne $x.elems;
                                normalize [fn |$_ for @$y   Z @$x  ] }
            when (More, *   ) { say "{' ' x $i*2}REPEAT x"; normalize [fn |$_ for @$y   X ($x,)] }
            when (*   , More) { say "{' ' x $i*2}REPEAT y"; normalize [fn |$_ for ($y,) X @$x  ] }
#             default           { $x.defined ?? callwith($y, $x) !! callwith($y) }
            default           { callwith |c }
        }
        $i--;
        say "{' ' x $i*2}'-> {r.gist}";
        r
    }
}

sub normalize (@arrays) {
    my @max-dims = roundrobin(|@arrays.map(&dimensions))».max;
    @max-dims ?? [@arrays.map: { zero-pad $_, @max-dims }] !! [@arrays];
}

sub zero-pad ($array, @size) {
    @size > 1 ?? [zero-pad ($array[$_]//[]), [@size[1..*]] for ^@size[0]]
              !! [$array[$_]//0 for ^@size[0]];
}

sub rank ($y) { dimensions($y).elems }

multi dimensions ($y) { () };
multi dimensions (@y) { @y.elems, |dimensions @y[0] };


#---------------- The array functions ----------------#

sub add ($y, $x = 0) is arrayfunction[0, 0] {
#     say "{' ' x $i*2}add {$y.gist}, {$x.gist}";
#     $i++;
    my \r = $y + $x;
#     $i--;
#     say "{' ' x $i*2}'-> {r.gist}";
    r
}

# sub iota ([$first, *@rest], $x = 0) is arrayfunction[1, 0] {
#     my $step = [*] @rest;
#     @rest ?? [iota @rest, $x + $_ * $step for ^$first]
#           !! [$x + $_                     for ^$first];
# }

sub iota ([$first, *@rest], $x = 0) is arrayfunction[1, 1000] {
    say "{' ' x $i * 2}iota {[$first, |@rest].gist}, {$x.gist}";
    $i++;
    my $step = [*] @rest;
    my \a = (@rest ?? [iota(@rest) »+» $_ * $step for ^$first] !! [^$first]);
    my \r = $x ?? add(a, $x) !! a;
    $i--;
    say "{' ' x $i * 2}'-> {r.gist}";
    r
}


#---------------- Demo ----------------#

sub pretty-print ($a) {
    do given rank($a) {
        when * < 2  { $a.join(" ") }
        when * >= 2 { $a.map(&pretty-print).join("\n" x $_ - 1) }
    }
}
macro demo ($expr) {
    quasi { say trim "$expr ->"; say pretty-print({{{$expr}}}) ~ "\n======" }
}
CATCH { when X::AdHoc { say $_.message } }

# demo iota([4]);
# demo iota([4],2);
# demo iota([10,10]);
# demo iota([2,3,4]);
# demo add([1,2,3],5);
# demo add([1,2,3],[10,10,10]);
# demo add([1,2,3],[1,2,3]);
# demo add(iota([2,3]),10);
# demo add(iota([2,3]),[0,10]);
# demo iota(iota([2,2],1));

# demo iota(iota([2,2],1),[2,3]);
# say iota( [[1, 2], [3, 4]], [2, 3] );
say iota( [[1, 2], [3, 4]] );
# say iota( [1, 2] );


# demo add(iota(add(iota([2, 2]), 1)), [2, 3]);
# demo add(iota(iota([2,2],1)), iota([2,3,4]));
# demo iota([0]);
# demo iota([1]);
# demo iota([0, 4]);
# demo iota([4, 0]);
# demo iota([2, 2]);
# demo iota(iota([2, 2]));
# demo iota([2, 3]);
# demo iota(iota([2, 3]));
# demo add(iota([3, 2]), [0, 10]);
