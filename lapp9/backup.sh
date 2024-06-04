#!/bin/sh

if [ $# -ne 2 ];then echo "Необходимо 2 параметра!";exit;fi

INPUT_DIR="$1"
BACKUP_DIR="$2"

TMP_BACKUP_DIR="$BACKUP_DIR/backup_$(date +%Y-%m-%d-%H-%M-%S)"
mkdir "$TMP_BACKUP_DIR"

cp -r "$INPUT_DIR"/* "$TMP_BACKUP_DIR"

CNT=$(ls $BACKUP_DIR | wc -l)
if [ $CNT -gt 5 ];then OLD_BACKUP=$(ls -t $BACKUP_DIR | tail -1);rm -rf $BACKUP_DIR/$OLD_BACKUP;fi