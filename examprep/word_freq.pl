#!/usr/bin/perl
# counts the number of words in STDIN
while ($line = <>) {
    $line =~ tr /A-Z/a-z/; 
    foreach $word ($line =~ /[a-z]+/g) {
        $count{$word}++;  
       # $line = $1; 
    }
}
@words = keys %count; 
@sorted_words = sort {$count{$a} <=> $counter{$b}} @words;
foreach $word (@sorted_words) {
    printf "%8d %s\n", $count{$word}, $word; 
}