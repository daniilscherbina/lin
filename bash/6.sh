#!/bin/bash

if [[ "$FOO" -eq 5 && "$BAR" -eq 1 ]]; then
    exit 1
fi
count=0

while [ -z "fix.txt" ]; do
    sleep 10
done

echo "File"
