#!/bin/sh
# list the files included by the C sources files included as arguments
for file in *.c
do 
    echo "$file includes:"
    egrep '^#include' "$file" | 
    cut -d' ' -f2  | 
    sed 's/[<>]//g'
done 