#!/usr/bin/perl

$command = $ARGV[0]; 
print "$command\n"; 
shift @ARGV;
shift @ARGV;  
while ($line = <>) {
    print "$line"; 
}
