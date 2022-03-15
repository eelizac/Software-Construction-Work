#!/bin/dash

# takes 2 arguments 
if test "$#" -ne 2
then 
    echo "hello_files.sh takes 2 arguments"
    exit 1
fi 

N=$1
STRING=$2
i=1
while test $i -le $N 
do 
    name="hello$i.txt"
    touch $name
    echo "hello $STRING">$name
    i=$(($i + 1))
done 