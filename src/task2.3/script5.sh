#!/bin/bash

interfaces=$(ip link show | awk '/^[0-9]+:/ {print $2}' | tr -d ":")

echo "Список сетевых интерфейсов:"
for interface in $interfaces; do
  echo "- $interface"
done

