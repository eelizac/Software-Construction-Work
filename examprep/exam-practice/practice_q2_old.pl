#!/usr/bin/perl -w
# gets the most common first names

while ($line = <>) { 
    if ($line =~ /^[^\|]*\|([^\|]*)\|([^\|]*)\|[^\|]*\|[^\|]*/) {
       # $name = $2; 
        $zid = $1;
        $2 =~ /^[^,]*,\s([^\s]*)/ ;
        $name = $1 ;
        
        $first_name{$zid} = $name ;
    }
}
@ids = keys %first_name; 
for $id (@ids) {
    $name = $first_name{$id}; 
   # print "$name "; 
    $freq{$name}++; 
}

my @sorted = sort {$freq{$b} <=> $freq{$a}} keys %freq; 
print "$sorted[0]\n"; 