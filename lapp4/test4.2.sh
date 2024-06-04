#!/bin/sh
count1=0
count2=0
list=($(pgrep -f -l $1 | grep ping))
list1=($(pgrep -f -l $2 | grep ping))
if [ $# -eq 2 ];
then
echo "ping по адресу $1"
for p in ${list[*]}; do
if [ $p != ping  ];then let "count1 += 1";fi
done
echo "$count1"
echo "ping по адресу $2"
for p in ${list1[*]};do
if [ $p != ping ];then let "count2 += 1";fi
done
echo "$count2"
else
echo 'Для выполнения сценария необходимо передать 2 параметра'
exit
fi
