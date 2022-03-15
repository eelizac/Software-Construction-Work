#!/bin/dash 

START=$1
END=$2
FILENAME=$3

while [ $START -le $END ]
do 
    echo $START 
    START=$((START+1))
done>$FILENAME 