#!/bin/sh 

# print the error message 
if test $# -eq 2 2>/dev/null
then 
    if test $1 -eq $1 2>/dev/null 
    then 
        if test $1 -lt 0 2>/dev/null 
        then 
            echo "./echon.sh: argument 1 must be a non-negative integer" 1>&2
            exit 1 
        else 
        :
        fi
    elif test $1 -gt 0 2>/dev/null
    then
        :
    else
        echo "./echon.sh: argument 1 must be a non-negative integer" 1>&2
        exit 1
    fi 

    i=0 
    while test $i -lt $1
    do 
        echo "$2"
        i=$((i + 1))
    done

else 
    echo "Usage: ./echon.sh <number of lines> <string>" 1>&2
    exit 1 
fi 