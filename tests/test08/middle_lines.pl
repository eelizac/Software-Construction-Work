#!/usr/bin/perl -w

$i = 1; 
while (<>) {
    $hash{$i} = $line; 
    $i = $i + 1; 
}

if ($i % 2 == 0) {
    # "odd"; 
    $index = $i /2; 
  #  print "$index\n"; 
  #  $output = $hash[$index]; 
    foreach $key (keys %hash) {
        if ($key == $index) {
            print "$hash{$key}"; 
        }
    }
  #  print "$hash[$index]\n"; 
} else {
    # "even"; 
}