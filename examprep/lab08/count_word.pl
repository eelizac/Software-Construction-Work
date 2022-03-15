#!/usr/bin/perl -w

$counter = 0; 
$needed = $ARGV[0];
shift @ARGV; 
while ($line = <>) {
 #   print "$line"; 
    @words = split(/[^a-zA-Z]+/, $line);
    foreach $word (@words) {
        $word = lc $word; 
        $counter++ if $word eq $needed;
    }
}

print "$needed occurred $counter times\n"