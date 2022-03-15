#!/bin/dash 

echo -n "Give your input "
read line 
#echo -n "$line"
case "$line" in 
1|5) 
    response="first option"
    ;;
[7-9]) 
    response="sec option"
    ;;
*) 
    response="third option"
    ;;
esac 

echo "$response"