#!/bin/sh


if [ $# -le 2 ];
then
for p in `pgrep -f $1`;do
for p1 in `pgrep -f -l $1 | grep ping`;do
kill $p
done
done
else
echo "Необходимо передать менее двух параметров"
fi
