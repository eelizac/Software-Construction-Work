#!/bin/sh

# print missing integer 
# it is in $@ 
min=$1
max=$1
for x in "$@"; do
    if [ $x -lt $min ]; then
        min=$x 
    elif [ $x -gt $max ]; then 
        max=$x
    fi
done 
i=$min
expected=()
while [ $i -lt $max ]; do 
    expected+=($i)
    i=$(( i + 1 ))
done 

#for x in "${expected[@]}"; do
#    echo "$x"
#done

for num in "${expected[@]}"; do 
    # check it is in "$@"
    in=0
    for y in "$@"; do
       # echo "y is $y and num is $num"
        if [ "$y" -eq "$num" ]; then
            in=1
        fi 
    done 

    if [ "$in" == 0 ]; then
        echo "$num" 
       i=0
    fi 
done 