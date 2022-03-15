#!/bin/sh 
# balancing_numbers.sh reads from stdin and writes to stdin 
# maps all digits less than 5 as < 
# maps all digits above 5 as > 

tr [0-4] '<' | tr [6-9] '>'

# OR 

tr '0123456789' '<<<<5>>>>'