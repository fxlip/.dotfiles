#!/bin/bash

while true; do
    prev_idle=$(awk '/^cpu / {print $5}' /proc/stat)
    prev_total=$(awk '/^cpu / {print $2+$3+$4+$5+$6+$7+$8}' /proc/stat)
    sleep 1
    curr_idle=$(awk '/^cpu / {print $5}' /proc/stat)
    curr_total=$(awk '/^cpu / {print $2+$3+$4+$5+$6+$7+$8}' /proc/stat)

    cpu_usage=$(( (100 * (curr_total - prev_total - (curr_idle - prev_idle))) / (curr_total - prev_total) ))
    echo "$cpu_usage%"
    sleep 1
done