#!/bin/sh

if [ $# -eq 2  ];
then
for i in `seq 1 3`;do ping $1 > /dev/null & done

for i in 1 2; do ping $2 > /dev/null & done
else
echo 'Для выполнения сценария необходимо передать 2 параметра'
exit
fi
