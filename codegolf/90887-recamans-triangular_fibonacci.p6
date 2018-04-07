use MONKEY-SEE-NO-EVAL;
get~~/(\d*)n(\d*)x(.*)/;
my \i=max($0,1)-1..($0+$1-1);
$_=$2;s:g/[\d+|\w]<before \d+|\w>/$/*/;
for ((0,->+a{my \x=a[*-1]-a;x>0&&x∉a??x!!a[*-1]+a}...*)Z
(0,1,*+*...*)Z
(map {$_*($_+1)/2},0..*))[i] ->(\r,\f,\t){say .EVAL}
