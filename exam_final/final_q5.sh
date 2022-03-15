#!/bin/dash 
# log - server logging output form last 24 ; log.1 - yeserday 
# log.6 compressed using gzip command - renamed todays day and the moved to archive 

for f in log.*; do
    echo "$f"
done