#!/bin/dash
# test script 
# subset 0 
# test $ address with s   
expected="test06_expected.txt"
output="test06_output.txt"
seq 10 15 | 2041 speed '$s/5/9/g' > $expected
seq 10 15 | ./speed.pl '$s/5/9/g' > $output

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
    echo "  + The correct output is: $print1"
else
    echo "${GREEN}Test Passed!${NC}"
fi

rm $expected
rm $output
