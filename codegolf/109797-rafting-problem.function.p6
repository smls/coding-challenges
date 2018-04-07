{[grep $^n>=*.all.sum,map ->\p{|map {p[0,|$_ Z..^|$_,p]},(1..^p).combinations},$^s.permutations].&{.grep: .map(+*).min}.min({.map((*.sum-$s.sum/$_)**2).sum})}
