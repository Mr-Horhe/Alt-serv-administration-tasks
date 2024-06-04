#!/bin/sh

cd /mnt/new_disk/
rm -rf *
umount -l /mnt/new_disk
rm -f /tmp//my_sys_2M.img

rmdir /mnt/new_disk