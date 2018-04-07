{my &t={(|(.shift,.pop)xx*)[^$_]}
my @a=map {|t [.comb]},t [.words];S:g/\S/{@a.shift}/}
