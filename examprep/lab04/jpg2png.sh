#!/bin/dash


 #Converts all images in current directory in JPEG format to PNG format 
for image in *.jpg; do 
  #  get the actual name of it 
    png=$(echo $image | sed -E 's/jpg$/png/')
    if [ -e "$png" ]; then
        echo "$png already exists\n" 
        exit 1
    fi 
    convert "$image" "$png" 2>/dev/null
    rm "$image"
    
done 