#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Использование: $0 <директория>"
    exit 1
fi

dir="$1"

if [ -d "$dir" ]; then
    echo "Директория '$dir' уже существует"
else
    if mkdir -p "$dir" 2>/dev/null; then
        echo "Директория '$dir' успешно создана"
    else
        echo "Ошибка: невозможно создать директорию '$dir' (проверьте права доступа)"
        exit 1
    fi
fi

