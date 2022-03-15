#!/bin/sh

#takes one arg, name of file 
if [ "$#" -ne 1 ]; then >/dev/null
    echo "Must have 1 arguments"
    exit 1
fi 

# make a backup - do not overwrite 
i=0
while [ -e ".$1.$i" ]; do 
    i=$(($i + 1))
done 
cp "$1" ".$1.$i"
echo "Backup of '$1' saved as '.$1.$i'"