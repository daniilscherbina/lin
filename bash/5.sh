#!/bin/bash

for file in $(find "/var/log" -type f -regex '[^\.]+\.log$'); do
    end_st=$(tail -n 1 $file)
    if [ -z "${end_st}" ]; then
        end_st=$(tail -n 2 $file | tr '\n' '')
    fi
    echo "$end_st" >> logs.log
done
