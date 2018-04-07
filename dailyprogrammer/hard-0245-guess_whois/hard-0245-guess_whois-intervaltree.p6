#!/usr/bin/env perl6

#----------------.
# Guess Who(is)? | <http://redd.it/3xdmtw> - using an interval tree
#----------------'

sub ip-to-number ($ip) {
    do given $ip.split('.') {
        .[0] +< 24 +
        .[1] +< 16 +
        .[2] +<  8 +
        .[3]
    }
}

class IntervalTree {
    has $.min;
    has $.max;
    has $!center = ($!min + $!max) div 2;
    has @!intervals;
    has IntervalTree $!left;
    has IntervalTree $!right;
    
    method new ($min, $max) { self.bless(:$min, :$max) }
    
    method insert (|c ($start, $end, $name)) {
        if $end < $!center and $!min < $!center - 1 {
            ($!left //= self.new($!min, $!center)).insert(|c)
        }
        elsif $start > $!center and $!max > $!center {
            ($!right //= self.new($!center, $!max)).insert(|c)
        }
        else {
            @!intervals.push: [$start, $end, $name, $end-$start]
        }
    }
    
    method prepare {
        @!intervals.=sort(*[3]);
        $!left .prepare if $!left;
        $!right.prepare if $!right;
    }
    
    method lookup ($n) {
        my $best = ($n < $!center ?? ($!left .lookup($n) if $!left)
                                  !! ($!right.lookup($n) if $!right));
        $best ?? @!intervals.first({ return $best if .[3] > $best[3];
                                     .[0] <= $n <= .[1] }) // $best
              !! @!intervals.first({ .[0] <= $n <= .[1] })
    }
}


sub MAIN ($ip-file, $query-file) {
    my $index = IntervalTree.new(0, ip-to-number '255.255.255.255');

    for $ip-file.IO.lines {
        my ($start, $end, $name) = .split(' ', 3);
        $index.insert(ip-to-number($start), ip-to-number($end), $name);
    }
    
    for $query-file.IO.lines.race(batch => 2500) -> $ip {
        my $name = $index.lookup(ip-to-number $ip)[2];
        say "$ip {$name // '<unknown>'}";
    }
}