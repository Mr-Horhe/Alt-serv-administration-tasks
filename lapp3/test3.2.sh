#!/bin/bash

if [ $# -eq 5 ]; then
su -l $3 -c '
cd /srv/dir1
touch file_u1d1
whoami && echo "создал файл в каталоге " && pwd
cd /srv/dir2
touch file_u1d2
echo "`whoami` создал файл в каталоге `pwd`" '
su -l $4 -c '
cd /srv/dir1
touch file_u2d1
whoami && echo "создал файл в каталоге " && pwd
cd /srv/dir2
touch file_u2d2
echo "`whoami` создал файл в каталоге `pwd`" '
su -l $5 -c '
cd /srv/dir1
touch file_u3d1
whoami && echo "создал файл в каталоге " && pwd
cd /srv/dir2
touch file_u3d2
echo "`whoami` создал файл в каталоге `pwd`" '
else
echo 'Для работы сценария необходимо 5 параметров'
exit
fi