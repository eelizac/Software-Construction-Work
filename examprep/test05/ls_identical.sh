#!/bin/sh
#takes pathname of 2 directories 
# print files which occur in both directions 

if test "$#" -ne 2; then 
    echo "Must have 2 arguments"
    exit 1 
fi 

directory1="$1"
directory2="$2"

for file in "$directory1"/*
do
    # compare file to corresponding file in directory2
    # any error message e.g. if file not present in directory2
    # is directed to /dev/null

    if diff "$file" "$directory2" >/dev/null 2>&1
    then
        basename "$file"
    fi
done