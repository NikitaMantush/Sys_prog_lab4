#!/bin/bash

if [ "$#" -ne 1 ]; then
  echo "Использование: $0 <директория>"
  exit 1
fi

directory="$1"

if [ ! -d "$directory" ]; then
  echo "Указанная директория не существует."
  exit 1
fi

files_with_permissions_755=()

for file in "$directory"/*; do
  if [ -f "$file" ] && [ "$(stat -c %a "$file")" = "755" ]; then
    files_with_permissions_755+=("$file")
  fi
done

echo "Файлы с правами доступа 755 в директории $directory:"
for file in "${files_with_permissions_755[@]}"; do
  echo "- $file"
done
