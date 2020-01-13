#! /bin/bash

# TODO: this doesn't give me the same results as polybar

ps -eo pcpu | \
awk 'BEGIN {sum=0.0f} {sum+=$1} END {print sum}'
