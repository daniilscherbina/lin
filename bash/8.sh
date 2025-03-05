#!/bin/bash


count=$(printenv | grep '^LC_' | awk -F= '{print $2}' | sort | uniq | wc -l)

if [ $count -gt 1 ]; then
    echo "256"
    exit 1
fi
