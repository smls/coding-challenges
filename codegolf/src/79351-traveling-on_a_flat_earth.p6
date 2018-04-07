my (\h,\v)=[Z+] lines».split(' ')».map: {m/(.*)(.)/;$1 eq'S'|'W'??-$0!!$0}
say "{abs h}{h <0??'S'!!'N'} {abs v}{v <0??'W'!!'E'}"
