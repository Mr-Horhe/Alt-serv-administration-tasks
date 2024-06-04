#!/bin/sh

#Функция для вывода справки
print_help() {
echo "Использование: $0 <путь_к_каталогу_для_копирования> <путь_к_каталогу_резервных_копий>"
echo "Примеры:"
echo "$0 --help"
}

#Функция для создания резервной копии
create_backup() {
local source_dir="$1"
local backup_dir="$2"
local timestamp=$(date +%Y-%m-%d-%H-%M-%S)
local backup_name="backup_$timestamp"
cp -r "$source_dir" "$backup_dir/$backup_name"
echo "$backup_name"
}

#Функция для ротации резервных копий
rotate_backups() {
local backup_dir="$1"
local max_backups=10
cd "$backup_dir" || exit 1
local backup_count=$(ls -1 | grep "^backup_" | wc -l)
if [ "$backup_count" -gt "$max_backups" ]; then
local oldest_backup=$(ls -1 | grep "^backup_" | sort | head -n 1)
rm -rf "$oldest_backup"
fi
}

#Проверка наличия ключа --help
if [ "$1" == "--help" ]; then
print_help
exit 0
fi

#Проверка наличия аргументов
if [ $# -lt 2 ]; then
echo "Ошибка: Недостаточно аргументов."
print_help
exit 1
fi

#Пути к каталогам
source_dir="$1"
backup_dir="$2"
#Создание резервной копии
backup_name=$(create_backup "$source_dir" "$backup_dir")

#Ротация резервных копий
rotate_backups "$backup_dir"

echo "Резервная копия успешно создана: $backup_name"
