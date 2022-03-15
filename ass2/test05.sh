#!/bin/dash
# test script 
# subset 0 
# test -n flag and g modifer  
expected="test05_expected.txt"
output="test05_output.txt"
seq 10 21 | 2041 speed '/2/,/^1/p'> $expected
seq 10 21 | ./speed.pl '/2/,/^1/p' > $output

difference=$(diff "$expected" "$output" | wc -l);

print1=$(cat $expected)
print2=$(cat $output)
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
if  [ $difference != 0 ]
then
    echo "${RED}Test Failed{$NC}"
    echo "  + Your output was: \n$print2"
    echo "  + The correct output is: $print1"
else
    echo "${GREEN}Test Passed!${NC}"
fi

rm $expected
rm $output
