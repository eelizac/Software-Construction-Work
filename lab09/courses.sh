#!/bin/dash
course=$1 #first arg 
url="http://www.timetable.unsw.edu.au/current/${course}KENS.html"
curl --location --silent $url | 

egrep $1 | 
cut -d '"' -f4-5 | 
cut -d '<' -f1 | 
sed s/.html//  |
sed -e 's|[>"'\'']| |g' | 
sed -e 's|[A-Z0-9]+\s[A-Z0-9]+||g' |
egrep -v "$1.*$1"|
sort  |
uniq 
# use egrep, sed, sort, uniq

# find the course names 
# sort them 
# unique them 

