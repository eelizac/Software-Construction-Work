#!/usr/bin/perl -w
# outputs student numbers of students enrolled in exactly 2 courses 

while ($line = <>) {
    if ($line =~ /^[^\|]*\|([^\|]*)\|[^\|]*\|/) {
        $freq{$1}++; 
    }
}

@ids = keys %freq; 
@ids_sort = sort @ids; 
foreach $id (@ids_sort) {
    if ($freq{$id} eq 2) {
        print"$id\n"; 
    }
    
}