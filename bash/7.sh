#!/bin/bash

path=$(echo $PATH | tr ':' '\n' | sort | uniq)

echo "$path" | while IFS= read -r line; do
    if [ -d "$line" ]; then
        count=$(find $line -maxdepth 1 -type f | wc -l)
        echo "$line => $count"
    fi
done
