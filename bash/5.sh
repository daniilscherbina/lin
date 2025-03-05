#!/bin/bash

for file in $(find "/var/log" -type f -regex '.*\.log$'); do
    end_st=$(tail -n 1 $file)
    echo "$end_st" >> logs.log
done
