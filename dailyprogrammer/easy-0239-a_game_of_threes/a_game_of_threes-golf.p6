#!/usr/bin/env perl6

#------------------.
# A Game of Threes | <http://redd.it/3r7wxz> - golf version
#------------------'

say get, { ($_ + (0,-1,1)[$_ % 3]) / 3 } ... 1;
