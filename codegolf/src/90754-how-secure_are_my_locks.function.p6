{reverse .sort: {use MONKEY-SEE-NO-EVAL;my &infix:<|>={|$^a,|$^b}
min map *.flat.sort.squish.reverse,EVAL .trans: '&'=>'X'}}
