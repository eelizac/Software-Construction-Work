#!/usr/bin/perl -w

# print file in order of length shortest to longest 
while (<>) {
    $n = $_;
    $length = length($n); 
    $hash{$n} = $length; 
}

@lines = keys %hash; 
@sorted = sort {$hash{$a} <=> $hash{$b} || $a cmp $b} @lines;
foreach $length (@sorted) {
    print "$length"; 
}