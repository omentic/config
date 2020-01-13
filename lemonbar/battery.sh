#! /bin/bash

echo -n "pwr: " && \
test "cat /sys/class/power_supply/BAT0/status/" = "Charging" && \ 
echo -n "⚡ " && \
cat /sys/class/power_supply/BAT0/capacity | tr -d "\n" && \
echo "%"

