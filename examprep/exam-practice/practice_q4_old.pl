#!/usr/bin/perl -w

while (<>) {
    if ($_ =~ /^[^\|]*\|([^\|]*)/) {
        $freq{$1}++; 
    }
}
@zids = keys %freq; 
foreach $zid (sort @zids) {
    if ($freq{$zid} == 2) {
        print "$zid\n"
    }
}