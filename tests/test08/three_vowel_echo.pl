#!/usr/bin/perl -w


foreach $word (@ARGV) {
    # get letter
   # print "-----$word-----\n" ;
    $count = 0; 
    @letters = split(//, $word); 
   
    foreach $letter (@letters) {
        $lower = lc $letter; 
        if ( $lower =~ /[aeiou]/) {
            $count++; 
        } else {
            $count = 0;
        }
        #print "$count"; 
        if ($count >= 3) {
            print "$word ";
            last; 
        }

    }
}
print "\n"; 
