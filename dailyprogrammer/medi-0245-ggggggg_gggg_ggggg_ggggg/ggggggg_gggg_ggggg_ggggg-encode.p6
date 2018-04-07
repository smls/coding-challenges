#!/usr/bin/env perl6

#---------------------------.
# Ggggggg gggg Ggggg-ggggg! | <http://redd.it/3x3hqa> - encoding
#---------------------------'


    sub huffman (%frequencies, $zero='0', $one='1') {
        my @queue = %frequencies.map: { .value => (hash .key => '') };
        while @queue > 1 {
            @queue.=sort;
            my $x = @queue.shift;
            my $y = @queue.shift;
            @queue.push: ($x.key + $y.key) => hash $x.value.deepmap($zero ~ *),
                                                   $y.value.deepmap($one  ~ *);
        }
        @queue[0].value;
    }
    
    
#     sub huffman3 (%frequencies, $zero='0', $one='1') {
#         my @queue = %frequencies.map: { .value => [[.key, ''],] };
#         while @queue > 1 {
#             @queue.=sort;
#             my $x = @queue.shift;
#             my $y = @queue.shift;
#             dd $x;
#             @queue.push: ($x.key + $y.key) => [|$x.value.map({ .[0], $zero ~ .[1] }),
#                                                |$y.value.map({ .[0], $one  ~ .[1] })];
#         }
#         @queue[0].value.flat.hash;
#     }
#     
#     sub huffman3 (%frequencies, $zero='0', $one='1') {
#         my $queue = (%frequencies.map: { .value, (.key, '') }).List;
#         while $queue > 1 {
#             $queue.=sort;
#             given zip $queue[0,1] -> [@freqs, @branches] {
# #                 dd @branches;
# #                 say $queue;
#                 dd list @freqs.sum,
#                         (@branches Z $zero, $one).map: -> [@branch, $prefix] {
#                     @branch.prefix[]
#                 }
#                 
#                 exit;
#                 
# #                 $queue.push: $_»[0].sum => [flat do for ($zero, $x.value), ($one, $y.value)  {
# #                     dd $branch;
# #                     $branch.map({ $^k, $prefix ~ $^v })
# #                 }]
#             }
#         }
#         $queue[0].value.hash;
#     }
    
    
    my $message = slurp.chomp;
    my %key = huffman $message.comb(/\w/).Bag, 'g', 'G';

    say %key.kv.join(' ');
    say $message.subst: /\w/, { %key{$_} }, :g;
