#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Использование: $0 <число1> [число2 ...]"
    exit 1
fi

sum=0
count=0

for num in "$@"; do
    if [[ $num =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
        sum=$(echo "$sum + $num" | bc)
        count=$((count + 1))
    else
        echo "Предупреждение: аргумент '$num' не является числом и будет проигнорирован"
    fi
done

if [ $count -eq 0 ]; then
    echo "Ошибка: не предоставлено ни одного числового аргумента"
    exit 1
fi

average=$(echo "scale=2; $sum / $count" | bc)
echo "Среднее значение: $averge"
