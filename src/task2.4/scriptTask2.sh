#!/bin/bash

if [ "$#" -ne 4 ]; then
  echo "Использование: $0 <каталог> <мин_размер> <макс_размер> <файл_результата>"
  exit 1
fi

directory="$1"
min_size="$2"
max_size="$3"
result_file="$4"

if [ ! -d "$directory" ]; then
  echo "$0: error: каталог '$directory' не существует." >&2
  exit 1
fi

if [ ! -r "$directory" ]; then
  echo "$0: error: нет прав на чтение каталога '$directory'." >&2
  exit 1
fi

if ! [[ "$min_size" =~ ^[0-9]+$ ]] || ! [[ "$max_size" =~ ^[0-9]+$ ]]; then
  echo "$0: error: некорректно заданы размеры." >&2
  exit 1
fi

if [ "$min_size" -ge "$max_size" ]; then
  echo "$0: error: минимальный размер должен быть меньше максимального." >&2
  exit 1
fi

find "$directory" -type f -size +"$min_size"c -a -size -"$max_size"c -exec stat -c "%n %s" {} \; > "$result_file"

total_files=$(wc -l < "$result_file")

echo "Общее число просмотренных файлов: $total_files"

echo "Поиск завершен. Результаты сохранены в файл: $result_file"

