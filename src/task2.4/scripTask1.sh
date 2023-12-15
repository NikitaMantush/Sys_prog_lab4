#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "$0: Некорректное количество аргументов. Использование: $0 <действие: архивировать/разархивировать> <имя_файла_или_каталога>"
  exit 1
fi

action="$1"
target="$2"

if [ ! -e "$target" ]; then
  echo "$0: error: файл или каталог '$target' не существует."
  exit 1
fi

archive() {
  if [ -d "$1" ]; then
    tar -czvf "$2" "$1" 2>/dev/null  echo "$0: error: не удалось создать архив."
  else
    echo "$0: error: '$1' не является каталогом."
  fi
}

extract() {
  tar -xzvf "$1" 2>/dev/null  echo "$0: error: не удалось распаковать архив."
}

case "$action" in
  "архивировать")
    archive "$target" "${target}.tar.gz"
    ;;
  "разархивировать")
    extract "$target"
    ;;
  *)
    echo "$0: error: неверное действие. Используйте 'архивировать' или 'разархивировать'."
    exit 1
    ;;
esac

