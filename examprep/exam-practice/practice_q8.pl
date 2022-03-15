#!/usr/bin/perl -w

while ($line = <>) {
  #  print $line; 
    @words = split(/\s+/, $line); 
    foreach $word (@words) {
       $original = $word;
       $word = lc $word; 
       
        my %letter_freq; 
        foreach $char (split //, $word) {
            $letter_freq{$char}++; 
            $prev = $letter_freq{$char}; 
        }
        $equi = 1; 
        foreach $key (keys %letter_freq) {
            if ($prev ne $letter_freq{$key}) {
                $equi = 0 ;
            }
            $prev = $letter_freq{$key}; 
        }

        if ($equi eq 1) {
            print "$original "; 
        }
    }
   print "\n"; 
}