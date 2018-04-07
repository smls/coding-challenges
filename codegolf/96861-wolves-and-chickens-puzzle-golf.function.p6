->*@a {(
[X](0 X..@a)[1..*-2]
.grep({![>](|$_,0)&![>](|(@a Z-$_),0)})
.combinations(2)
.combinations
.map(|*.permutations)
.map({.map(|*)»[*]})
.map({((|$_,(0,0)ZZ-@a,|$_)ZX*|(-1,1)xx*)»[*]})
.grep({.all.&{.all>=0&&3>.sum>0}})
.map({.map:{[~](<W C>Zx$_)}})
if [<=] @a
)[0]//()}
