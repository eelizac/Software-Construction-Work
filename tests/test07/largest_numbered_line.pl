#!/usr/bin/perl -w

while ($line = <>) {
    if ($line =~ /([-\d.]+)/) {
      #  print "$line and $1"; 
        $num{$1} = $line; 
    }
}

# find the max key 
@nums = keys %num; 
for $n (sort @nums) {
    print "$num[$n]"; 
}
