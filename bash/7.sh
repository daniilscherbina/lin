#!/bin/bash

path=$(echo $PATH | tr ':' '\n')

echo "$path" | while IFS= read -r line; do
    count=$(find $line -maxdepth 1 | wc -l)
    echo "$line => $count"
done
