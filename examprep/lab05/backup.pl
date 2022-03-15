#!/usr/bin/perl -w
# Takes one arguments 

if ("$#ARGV" != 0) {
    print "backup.pl must only have 1 argument\n"; 
    exit(1) 
}
$i = 0; 
while (-e ".$ARGV[0].$i") {
    $i = $i + 1; 
    print ".$ARGV[0].$i\n"; 
}

print "$i\n"; 