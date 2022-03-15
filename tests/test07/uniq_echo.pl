#!/usr/bin/perl -w

for $arg (@ARGV) {
    if (exists($word{$arg})) {
       
    } else {
        $word{$arg} = 1; 
        print "$arg "; 
    }  
}

print "\n"; 