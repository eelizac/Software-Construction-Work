#!/bin/dash
# test script 
# subset 0 
# test substitue command 
expected="test03_expected.txt"
output="test03_output.txt"
seq 100 111 | 2041 speed 's/11/1234/'> $expected

seq 100 111 | ./speed.pl 's/11/1234/' > $output

difference=$(diff "$expected" "$output" | wc -l);

print1=$(cat $expected)
print2=$(cat $output)
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
if  [ $difference != 0 ]
then
    echo "${RED}Test Failed${NC}"
    echo "  + Your output was:\n $print2"
    echo "  + The correct output is:\n $print1"
else
    echo "${GREEN}Test Passed!${NC}"
fi

rm $expected
rm $output
