#!/bin/dash
# test script 
# subset 0 
# test comma separated address with s command 

expected="test07_expected.txt"
output="test07_output.txt"
seq 10 20 | 2041 speed '/2/,/7/s/[12]/9/' > $expected
seq 10 20 | ./speed.pl '/2/,/7/s/[12]/9/' > $output

difference=$(diff "$expected" "$output" | wc -l);

print1=$(cat $expected)
print2=$(cat $output)
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
if  [ $difference != 0 ]
then
    echo "${RED}Test Failed${NC}"
    echo "  + Your output was: \n$print2"
    echo "  + The correct output is: \n$print1"
else
    echo "${GREEN}Test Passed!${NC}"
fi

rm $expected
rm $output
