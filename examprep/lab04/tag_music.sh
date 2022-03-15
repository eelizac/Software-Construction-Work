#!/bin/dash 
# set the ID3 tags to the correct value using information from file names and directory names int 
for album_path in "$@"; do
    album_name=$(basename "$album_path")
    year=$(echo $album_name | sed -E 's/.* //') # delete everything before the comma 
    for mp3_pathname in "$album_path"/*.mp3; do 
        name=$(basename "$mp3_pathname" .mp3) #remove .mp3 
        track=$(echo $name | sed -E 's/ .*$//')
        artist=$(echo $name | sed -E 's/^.* - //')
        title=$(echo $name | sed -E 's/[^-]*$//; s/^[^-]*//; s/[-]//g; s/^\s//; s/\s$//g' )
        id3 -t "$title" -T "$track" -a "$artist" -A "$album" -y "$year" "$mp3_pathname" > /dev/null
    done 
done