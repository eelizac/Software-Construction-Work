#!/bin/sh

# print which file has the MOST lines 
# put into a hash 
i=0
for file in "$@"
do
    echo $(wc -l $file)
    
done  | 
sort -t' ' -k1,1 -nr | 
head -1 | 
cut -d' ' -f2

