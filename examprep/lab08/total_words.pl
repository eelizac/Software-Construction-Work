#!/usr/bin/perl -w
$counter = 0; 
while ($line = <>) {
    @words = split(/[^a-zA-Z]+/, $line);
    foreach $word (@words) {
        $counter++ if $word ne '';
    }
}

print "$counter words\n"