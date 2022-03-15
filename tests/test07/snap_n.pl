#!/usr/bin/perl -w
$n = $ARGV[0];
shift @ARGV; 
while ($line = <>) {
    $words{$line}++; 
    if ($words{$line} eq $n) {
        print "Snap: $line";
        last; 
    }
}