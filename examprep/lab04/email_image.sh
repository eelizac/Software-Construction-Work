#!/bin/dash

# given a list of image files as args, display them one by one 
# after user has viewed an image, the script should prompt the user for an email-address 
# if does enter, should promp for message to accompany, then send image 

for image in "$@"; do 
    display "$image"
    read -p "Address to e-mail this image to? " address 
    if [ $address ]; then
        read -p "Message to accompany image? " message
      #  echo "$address $message" 
        echo "$message" | mutt -s "$image" -e 'set copy=no' -a $image -- $address
        echo "$image sent to $address"
    else 
        echo "No email sent"
    fi 

done 