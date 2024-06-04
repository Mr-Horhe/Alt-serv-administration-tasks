#!/bin/sh

test_dir=$(mktemp -d)
backup_dir=$(mktemp -d)

for i in {1..5};do
	touch "$test_dir/file$i"
done

for i in {1..11};do
	./backup.sh "$test_dir" "$backup_dir"
	#Цикл слишком быстро создавал бэкапы, быстрее секунды, из-за этого у файлов бэкапов название получалось одинаковым
	#Поэтому сделал задержку в одну секунду между созданием резервных копий
	sleep 1
done
ls "$backup_dir"
num_backups=$(ls "$backup_dir" | wc -l)
echo "$num_backups"
if [ "$num_backups" -eq 10 ]; then
    echo "ТЕСТ ПРОЙДЕН"
else
    echo "ТЕСТ ПРОВАЛЕН"
fi

rm -rf "$test_dir" "$backup_dir"
