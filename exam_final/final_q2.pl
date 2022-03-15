#!/usr/bin/perl -w

$count = 0;
while ($line = <STDIN>) {
    if ($line =~ /\|(\d*)\/\d\|[MF]$/) {
       # print "$line";
       # print "$1\n";  
        if ($1 eq 3711) {
            $count = $count + 1;  
        }
    }
}

print "$count\n"; 