#!/bin/dash
# Saves copies of all files in the cd 
# create a directory called .snapshot.0 to store the backup copies of the files 
if [ "$#" -ne 0 ]; then 
    echo "Usage: snapshot-save.sh does not take any arguments"
    exit 1
fi 
i=0
while [ -d ".snapshot.$i" ]; do 
    i=$(($i + 1))
done
mkdir ".snapshot.$1" || exit 1
echo "Creating snapshot $i"
# move into the directory 
for file in *; do
    if test -f "$file" -a "$file" != snapshot-save.sh -a "$file" != snapshot-load.sh
    then 
        cp -p "$file" ".snapshot.$i"
    fi 
    
done 
