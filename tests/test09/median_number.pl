#!/usr/bin/perl

@sorted = sort { $a <=> $b } @ARGV;

my $size = @sorted; #stores the size of the array 
$median_indice = ($size / 2) - 0.5;

print "@sorted[$median_indice]\n";