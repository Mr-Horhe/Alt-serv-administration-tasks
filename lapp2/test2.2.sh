#!/bin/sh

df -H /mnt/new_disk
df -i /mnt/new_disk
cd /mnt/new_disk/new_dir
echo 'Количество созданных файлов'
ls -l | wc -l