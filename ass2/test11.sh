#!/bin/dash
# test script 
# subset 1
# white spaces, multiple commands, and ranges 
expected="test11_expected.txt"
output="test11_output.txt"
echo /2/d >  commands.speed
echo 4q   >> commands.speed

seq 1 100 | 2041 speed '10q; 2,   /5*/p' > $expected

seq 1 100 | ./speed.pl '10q; 2,   /5*/p' > $output

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
