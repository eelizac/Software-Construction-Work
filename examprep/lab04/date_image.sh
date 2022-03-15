#!/bin/dash
# Given a list of images, change each file so it has a label to indicate the time it was taken 
# last modiciation time = time taken 

for image in "$@"; do 
    # get the last modification time 
    date=$(echo "$(ls -l $image)" | cut -d' ' -f6-9)

    mogrify -gravity south -pointsize 36 -draw "text 0,10 '$date'" "$image" &&
    touch -d "$date" "$image" 
done 