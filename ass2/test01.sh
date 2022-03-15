#!/bin/dash
# test script 
# subset 0 
# test print command 
expected="test01_expected.txt"
output="test01_output.txt"
seq 605 690 | 2041 speed '/.6./p' > $expected

seq 605 690 | ./speed.pl '/.6./p' > $output

difference=$(diff "$expected" "$output" | wc -l);

print1=$(cat $expected)
print2=$(cat $output)
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
if  [ $difference != 0 ]
then
    echo "${RED}Test Failed ${NC}"
    echo "  + Your output was: $print2"
    echo "  + The correct output is: $print1"
else
    echo "${GREEN}Test Passed!${NC}"
fi

rm $expected
rm $output
