#!/bin/dash
# test script 
# subset 0 
# test substitue command 
expected="test10_expected.txt"
output="test10_output.txt"
echo /2/d >  commands.speed
echo 4q   >> commands.speed

seq 1 20 | 2041 speed -f commands.speed > $expected

seq 1 20 | ./speed.pl -f commands.speed > $output

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
