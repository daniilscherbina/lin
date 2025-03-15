#!/bin/bash

for file in /var/log/*.log; do
    end_st=$(tail -n 1 $file)
    if [ -z "${end_st}" ]; then
        end_st=$(tail -n 1 $file)
    fi
    echo "$end_st" >> logs.log
done
