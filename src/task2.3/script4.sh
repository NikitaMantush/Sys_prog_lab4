#!/bin/bash

counter=0

reset_counter() {
  counter=0
  echo "Значение счетчика сброшено в 0."
}

trap 'reset_counter' SIGUSR1

while true; do
  echo "Значение счетчика: $counter"
  sleep 2
  ((counter++))

  if [ $counter -eq 5 ]; then
    counter=0
    kill -s SIGUSR1 $$
  fi
done
