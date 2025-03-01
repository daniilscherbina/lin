#!/bin/bash

timeframe=$1
file=$2

while [ $timeframe -gt 0 ]
do
  avg=$(cat /proc/loadavg)
  echo "$(date +'%d.%m.%y %H:%M:%S') = $avg" >> $file
  timeframe=$(($timeframe - 1))
  sleep 1
done
