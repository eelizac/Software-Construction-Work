#!/usr/bin/perl -w

# program that reads lines form stdin
# if line 2 or more integers, swaps first and last integer 

while ($line = <>) {
    # count the number of integers 
    
    $original_line = $line; 
    $num_int = 0;
  #  print "\nORIGNAL $line";
    # gethte first one 
    if ($line =~ /(\d)/) {
        $num_int = 1; 
        $first_int = $1; 
        $line =~ s/\d//;
    }
    while ($line =~ /(\d)/) {
        $last_int = $1; 
        $num_int += 1; 
        $line =~ s/\d//;
    }
    #print "NUM --- $num_int\n";
   if ($num_int >= 2) {
      # print "first_int = $first_int\n"; 
       $original_line =~ s/$first_int/$last_int/;
     #  print "NEW $original_line";
       $original_line =~ s/(\d)[\D]*$/$first_int/;

   }
   
     print "$original_line\n"; 
}