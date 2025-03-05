#!/bin/bash

for path in "$@"; do
    if [ -e "$path" ]; then
        count=$(wc -l $path)
        count=${count/" $path"/""}
        echo "$path => $count"
    else
        echo "$path => not found"
    fi
done
