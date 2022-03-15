#!/bin/sh

for arg in $*
do	
	display $arg
	echo -n "Address to e-mail this image to? "
	if [-z $addr] 2> /dev/null 
	then 
		continue 
	else 	
		read email
		echo -n "Message to accompany image? "
		read message
	fi 


	fn=`echo $arg | cut -d'.' -f1`

	echo $message|mutt -s $fn! -e 'set copy=no' -a $arg -- $email

	echo "$arg sent to $email"
done
