#!/bin/bash

if [[ "$FOO" -eq 5 && "$BAR" -eq 1 ]]; then
    exit 1
fi
count=0

timeout -k 5 15s bash -c 'while [ -z "$(ls -A .)" ]; do
    sleep 1
    count=$(($count+1))
    if [ $count -eq 100 ]; then
        exit 1
    fi
done'

echo "File"
