#!/usr/bin/perl -w

@sorted = sort {$a <=> $b} @ARGV;
$median_index = @ARGV / 2;
$median = $sorted[$median_index]; 
print "$median\n";
