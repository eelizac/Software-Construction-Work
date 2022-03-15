#!/usr/bin/perl -w
while ($line = <STDIN>) {
    $line =~ s/^(\w+\|\d+\|)(.*\w),\s(.*\w)(\s*\|\d+.*\|[MF])$/$1$3 $2$4/;
    print "$line";
}

