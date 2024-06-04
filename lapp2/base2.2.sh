#!/bin/sh

truncate -s 2M /tmp/my_sys_2M.img

mkfs.ext2 /tmp/my_sys_2M.img
mkdir /mnt/new_disk
mount /tmp/my_sys_2M.img /mnt/new_disk
df -H /mnt/new_disk
#pwd
mkdir /mnt/new_disk/new_dir
cd /mnt/new_disk/new_dir
#pwd
i=1; while [ $i -le 4 ]; do touch file_$i; dd if=/dev/zero of=/mnt/new_disk/new_dir/file_$i bs=128K count=4; i=$[i+1];done