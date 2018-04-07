->\h,\m{my \n=round(m/5)%12;say "IT IS HALF TEN
QUARTER TWENTY
FIVE MINUTES TO
PAST TWO THREE
ONE FOUR FIVE
SIX SEVEN EIGHT
NINE TEN ELEVEN
TWELVE O'CLOCK".subst: /\S+/,{++$==1|2|(0,7,4,5,6,(6|7),3)[min n,12-n]|8*?(n%3)|(23,10,9)[(n+5)/6]|(13,11,12,|(14..*))[(h+m/33-1)%12]??$_!!" "x.comb},:g}
