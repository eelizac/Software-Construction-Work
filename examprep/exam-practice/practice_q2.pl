#!/usr/bin/perl -w
# prints the first name of all students 
while ($line = <>) {
    if ($line =~ /^[^\|]*\|[^\|]*\|([^\|]*)\|/) {
        $firstname{$1}++; 
    }
}
@names_unsorted = keys %firstname; 
@names = sort @names_unsorted; #sorting an array 
foreach $name (@names) {
    if ($name =~ /^\w*,\s(\w*).*$/) {
        print "$1\n"; 
    }   

}