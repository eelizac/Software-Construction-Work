#!/usr/bin/perl -w
$count = 0 ; 
for $filename (@ARGV) {
    while ($line = <>) {
        if ($line =~ /\S*\s(\d+)\s(.*)$/) {
            if ($2 eq 'Orca') {
                #print "hi"; 
                $count = $count + $1; 
            }
        }
    }
    print "$count Orcas reported in $filename\n";

}