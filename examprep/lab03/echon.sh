#!/bin/dash
# Given 2 args (integer and string) print the string n times 

# Error Checking 
if  [ "$#" -ne 2 ]; then 
    echo 'Usage: ./echon.sh <number of lines> <string>'
    exit 1
fi 

n=$1
string=$2 
i=0
while test $i -lt $n
do 
    echo $string
    i=$((i+1))
done 