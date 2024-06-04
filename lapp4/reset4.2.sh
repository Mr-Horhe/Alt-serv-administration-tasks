#!/bin/sh

#всё ниженаписанное можно было заменить командой killall ping

if [ $# -eq 2 ];
then
for p in `pgrep -f $1`
do
for p1 in `pgrep -f -l $1 | grep ping`;do
kill $p
done
done
for k in `pgrep -f $2`
do
for k1 in `pgrep -f -l $2 | grep ping`;do
kill $k
done
done
else
echo 'Для выполнения сценария необходимо передать 2 параметра'
exit
fi
