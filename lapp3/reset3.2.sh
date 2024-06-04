#!/bin/bash

if [ $# -eq 5 ];then
rm -rf /srv/dir1 /srv/dir2

userdel -r $3
userdel -r $4
userdel -r $5

groupdel $1
groupdel $2
else
echo "Для выполнения сценария необходимо 5 параметров"
exit
fi