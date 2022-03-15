#!/bin/dash
# test script 
# subset 0 
# test non-whitespace character delimit for substitute command 

expected="test08_expected.txt"
output="test08_output.txt"
seq 1 15 | 2041 speed 'sX[15]Xz/z/zX' > $expected
seq 1 15 | ./speed.pl 'sX[15]Xz/z/zX'> $output

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
