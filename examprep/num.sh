#!/bin/dash 

if [ "$#" -ne 2 ]; then
    echo "Must have 2 args"
    exit 1
fi 

n=$1
word=$2
i=0
while [ $i -ne $n ]; do 
    echo $word
    i=$((i + 1))
done