#!/bin/dash
# test script 
# subset 0 
# test -n flag and g modifer  
expected="test04_expected.txt"
output="test04_output.txt"
echo Hello Andrew | 2041 speed 's/[oe]/O/g'> $expected

echo Hello Andrew | ./speed.pl 's/[oe]/O/g' > $output

difference=$(diff "$expected" "$output" | wc -l);

print1=$(cat $expected)
print2=$(cat $output)
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'
if  [ $difference != 0 ]
then
    echo "${RED}Test Failed{$NC}"
    echo "  + Your output was: $print2"
    echo "  + The correct output is: $print1"
else
    echo "${GREEN}Test Passed!${NC}"

fi

rm $expected
rm $output
