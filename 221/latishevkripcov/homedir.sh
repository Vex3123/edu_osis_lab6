#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <имя_пользователя>"
    exit 1
fi

username="$1"
homedir=$(grep "^$username:" /etc/passwd | cut -d: -f6)

if [ -z "$homedir" ]; then
    echo "Ошибка: пользователь '$username' не найден"
    exit 1
else
    echo "Домашняя директория пользователя '$username': $homedir"
fi
