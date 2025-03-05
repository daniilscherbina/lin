#!/bin/bash


uniq_lc=$(printenv | grep '^LC_' | awk -F= '{print $2}' | sort | uniq)
count=$(echo unic_lc | wc -l)

if [ $count -ne 1 ]; then
    echo "256"
    exit 1
fi
