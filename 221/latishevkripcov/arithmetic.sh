#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Использование: $0 <число1> <число2> <операция(+,-,*,/)>"
    exit 1
fi

num1="$1"
num2="$2"
op="$3"

# Проверка что аргументы - числа
if ! [[ $num1 =~ ^-?[0-9]+(\.[0-9]+)?$ ]] || ! [[ $num2 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Ошибка: аргументы должны быть числами"
    exit 1
fi

case $op in
    +)
        result=$(echo "$num1 + $num2" | bc)
        ;;
    -)
        result=$(echo "$num1 - $num2" | bc)
        ;;
    \*)
        result=$(echo "$num1 * $num2" | bc)
        ;;
    /)
        if [ $(echo "$num2 == 0" | bc) -eq 1 ]; then
            echo "Ошибка: деление на ноль"
            exit 1
        fi
        result=$(echo "scale=2; $num1 / $num2" | bc)
        ;;
    *)
        echo "Неизвестная операция: $op"
        exit 1
        ;;
esac

echo "Результат: $result"
