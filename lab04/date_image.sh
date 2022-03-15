#!/bin/dash

for img in $*
do
    last_mod=$(ls -l $img | cut -d' ' -f6-8)
    mogrify -gravity south -pointsize 36 -draw "text 0,10 '$last_mod'" $img
done