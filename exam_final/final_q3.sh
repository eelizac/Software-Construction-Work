#!/bin/dash 

for f in *; do
   # echo "$f"
    if [ ! -d "$f" ]; then 
        continue 
    fi 
   # count the number of files in $f 
   num=$(ls $f | wc -l)

   if [ $num -ge 2 ]; then 
        echo "$f"
   fi 
done 