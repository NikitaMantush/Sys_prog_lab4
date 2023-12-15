#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "$(basename "$0"): Неверное количество аргументов. Использование: $0 <путь_к_папке>"
  exit 1
fi

output_directory="$1"

if [ ! -d "$output_directory" ]; then
  echo "$(basename "$0"): Папка '$output_directory' не существует или недоступна."
  exit 1
fi

if ! command -v fswebcam &> /dev/null; then
  echo "$(basename "$0"): Утилита fswebcam не установлена. Попытка установки..."
  if ! sudo apt-get install -y fswebcam; then
    echo "$(basename "$0"): Ошибка установки утилиты fswebcam."
    exit 1
  fi
fi

timestamp=$(date +"%Y%m%d_%H%M%S")
filename="$output_directory/photo_$timestamp.jpg"

if fswebcam -r 640x480 --no-banner "$filename"; then
  echo "$(basename "$0"): Фотография сохранена в '$filename'."
else
  echo "$(basename "$0"): Ошибка при создании фотографии."
fi
S
