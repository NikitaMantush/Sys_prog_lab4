#!/bin/bash

current_time=$(date +"%H:%M")

calendar=$(cal)

notification_message="Текущее время: $current_time\n\nКалендарь:\n$calendar"

notify-send "Информация" "$notification_message"
