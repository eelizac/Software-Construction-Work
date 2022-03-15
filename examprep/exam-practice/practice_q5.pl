#!/usr/bin/perl -w

# reads line from text and if it contains two or more itnegers swap first and last 
while ($line = <>) {
    if ($line =~ /(\d).*(\d)/) {
        $line =~ s/(\d)(.*)(\d)/$3$2$1/; 
    }
    print "$line\n"; 
}