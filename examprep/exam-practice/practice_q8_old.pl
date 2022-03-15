#!/usr/bin/perl -w

# reads line from text in stdin prints into stdout with 
# words which are NOT equi-lettered are removed. --> every character occurs n times 

while ($line = <>) {
    $line = $line.' ';
     
    while ($line =~ /^(\S*)\s/) {
        $word = $1;
      #  $word = lc $word;
        # check if it is equilettered 
        foreach $char (split //, $word) {
            $char = lc $char;
            $letter{$char}++; 
            $last_char = $char;
        }
        @letter_keys = keys %letter;
        $prev = $last_char;
        $condition = 1; 
       # print"$word\n"; 
        foreach $ch (@letter_keys) {
         #   print "$letter{$ch} $ch $letter{$prev} $prev\n";
            if ("$letter{$prev}" ne "$letter{$ch}") {
                $condition = 0 ;
                $prev = $ch
           }
        }
        %letter = (); 
       # print "$word";
       # print "$condition";
       # $condition = 1; 
        if ($condition == 1) {
            print "$word ";
        }        
        $line=~ s/^\S*\s//; 
    }
    print"\n";
}
