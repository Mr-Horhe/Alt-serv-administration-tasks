#!/bin/sh

DATA_FILE="data.txt"

if [ ! -f $DATA_FILE  ];then
	touch $DATA_FILE
fi

new_record() {
	local name="$1"
	local phone="$2"
	#echo "$name"
	#echo "$phone"

	if grep -q "$phone" "$DATA_FILE";then
		echo "Телефон уже существует!"
	else
		echo "$name:$phone" >> $DATA_FILE
	fi
}


search_record() {
	local query="$1"
	grep -i "$query" $DATA_FILE | cut -d ':' -f 2
}


list_records() {
	sort $DATA_FILE
}

delete_record() {
    local query="$1"
    sed -i "/$query/d" $DATA_FILE
    echo "Запись удалена"
}


show_help() {
    echo "Пример использования:"
    echo " ./phone-book.sh команда [аргументы]"
    echo "Доступные команды:"
    echo " new <имя> <номер> Добавление записи в телефонную книгу"
    echo " search <имя-или-номер> Поиск записей в телефонной книге"
    echo " list Просмотр всех записей"
    echo " delete <имя-или-номер> Удаление записи"
    echo " help Показ этой справки"
}


case $1 in
    "new")
    	new_record "$2" "$3"
    	;;
    "search")
    	search_record "$2"
    	;;
    "list")
    	list_records
    	;;
    "delete")
    	delete_record "$2"
    	;;
    "help")
    	show_help
    	;;
    *)
    	echo "Неверная команда. Используйте 'help' для справки."
    	exit 1
    	;;
esac

exit 0


