#!/bin/dash 

# 2 arguments 
if [ "$#" -ne 2 ]; then 
    echo "Must have 2 arguments"
    exit 1
fi 
string1=$1
#y=$(${string1//\n/})
string2=$2

start=$(echo "$string1$string2" |
fold -w 1 | sort | uniq -c |
sed 's/^\s*//' | sed /^[2468]/d | cut -d' ' -f2 | sed -n 1p)
end=$(echo "$string1$string2" |
fold -w 1 | sort | uniq -c |
sed 's/^\s*//' | sed /^[2468]/d | cut -d' ' -f2 | sed -n 2p)
#echo "$start $end"
i=$start
while [ $i -le $end ]; do
    echo "bell1$i"
    i=$((i + 1)
done

# then: find the indice in which it is changed 