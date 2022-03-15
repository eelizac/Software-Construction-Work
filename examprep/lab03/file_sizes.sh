#!/bin/sh 
small_files=""
med_files=""
large_files=""

for file in * # already in alphabtical order when looping 
do
    lines=$(wc -l $file | cut -d ' ' -f1)
   # echo $lines
   if [ $lines -lt 10 ] 
   then 
        small_files+=" $file"
   elif test $lines -lt 100; then 
        med_files+=" $file"
    else 
        large_files+=" $file"
    fi
done 

echo "Small files:$small_files"
echo "Medium-sized files:$med_files"
echo "Large files:$large_files"