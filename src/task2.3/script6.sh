#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Использование: $0 <имя_файла> <маска_разрешений>"
  exit 1
fi

current_umask=$(umask)

file_name="$1"
permissions_mask="$2"

touch "$file_name"
chmod "$permissions_mask" "$file_name"

umask "$current_umask"

echo "Файл $file_name создан с маской разрешений $permissions_mask."
echo "Маска разрешений возвращена к значению по умолчанию."
