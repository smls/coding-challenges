#!/usr/bin/env perl6
use lib 'lib';
use Test::Golf;

golf-ok
    thaw-in => *.comb(/\d+/)».Int.Capture,
    thaw-out => *.comb(/\d+/)».Int.List,
;

=finish
12, 1000 -> [5, 7, 11, 17, 19, 29, 31, 41, 47, 59, 61, 67, 71, 89, 97, 101, 127, 137, 139, 151, 167, 179, 181, 199, 211, 227, 229, 239, 251, 257, 269, 271, 281, 337, 347, 367, 389, 397, 409, 419, 421, 431, 449, 467, 479, 487, 491, 509, 557, 587, 601, 607, 619, 631, 641, 647, 661, 727, 739, 757, 761, 797, 809, 811, 827, 907, 929, 941, 971, 997]
2, 999 -> [3, 5, 11, 17, 29, 41, 59, 71, 101, 107, 137, 149, 179, 191, 197, 227, 239, 269, 281, 311, 347, 419, 431, 461, 521, 569, 599, 617, 641, 659, 809, 821, 827, 857, 881]
3, 1500 -> [2]
30, 1500 -> [7, 11, 13, 17, 23, 29, 31, 37, 41, 43, 53, 59, 67, 71, 73, 79, 83, 97, 101, 107, 109, 127, 137, 149, 151, 163, 167, 181, 193, 197, 199, 211, 227, 233, 239, 241, 251, 263, 277, 281, 283, 307, 317, 337, 349, 353, 359, 367, 379, 389, 401, 409, 419, 431, 433, 449, 457, 461, 479, 491, 541, 547, 557, 563, 569, 571, 577, 587, 601, 613, 617, 631, 643, 647, 653, 661, 709, 727, 739, 743, 757, 797, 809, 823, 827, 829, 853, 857, 877, 881, 907, 911, 937, 941, 947, 953, 967, 983, 991, 1009, 1019, 1021, 1031, 1033, 1039, 1061, 1063, 1087, 1093, 1123, 1151, 1163, 1171, 1187, 1193, 1201, 1229, 1249, 1259, 1277, 1289, 1291, 1297, 1399, 1409, 1423, 1429, 1451, 1453, 1459, 1481, 1493]