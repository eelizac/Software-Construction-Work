#!/usr/bin/perl
$commands = $ARGV[0];

if ($commands eq '-f') {
    $flag = 1; 
    $commands_file = $ARGV[1]; 
    open my $f, "<", "$commands_file"; 
    while ($line = <$f>) {
        $commands = $line ;
    }
 # print "$condition\n"; 
    while ($line = <$f>) {
        $commands = $commands . "$line";
    }
}

$commands =~ s/\n/;/; 
$commands =~ s/\n$//; 
$commands_original = $commands .";";

if ($commands_original =~ /#/) {
    $commands_original =~ s/#[^;\n]*//g; 
}
$commands_original =~ s/ //g; 
$commands_original =~ s/\n//g; 
#print "$commands_original\n"; 
if (@ARGV > 2 and $ARGV[0] ne '-n') {
    $i = 1; 
    if ($flag eq 1) {
        $i = 2; 
    }
    open my $input, ">>", "input.txt" or die; #write 
    while ($i <= $#ARGV) {
        open my $f, "<", "$ARGV[$i]" or die; #read 
        while ($line = <$f>) {
            print {$input} $line; 
        }
        $i = $i + 1; 
    }

    close $f;
   # open my $input, "<", "input.txt" or die; #read
} else {
 #   $input = STDIN; 
    open my $input, ">>", "input.txt" or die; 
    while ($line = <STDIN>) {
        print {$input} $line; 
    }
    close $input; 
}

$counter = 1; 
$print = 1; 
$range_on_del = 0; 
$range_on_print = 0; 
%removed;
$range_on = 0;
$none = 0;
if ($commands eq '-n') {
    $n = 1; 
    $commands_original = $ARGV[1].";"; 
    if ($commands_original =~ /[dq]/) {
        $none = 1; 
    }
} else {
    $n = 0; 
}
#print "$commands\n"; 

open my $input, "<", "input.txt" or die; 
while ($line = <$input>) {
    #print "$line"; 
    $commands = $commands_original; 
    while ($commands =~ /[;\n]/) {
        $commands =~ /^([^;\n]*)[;\n](.*)$/; 
        $condition = $1;
        #print "$condition\n"; 
        $commands = $2; 
        
        if ($condition =~ /s/) {
            $address = 0; 
            $regex_add = 0; 
            $final = 0; 
            
            if (substr($condition, 1, 1) eq 's') {
                $address = substr($condition, 0, 1); 
                $condition =~ s/^.s//; 
            }
            if ($address eq '$') {
                $final = 1; 
            } else {
                if ($condition =~ /,/) {
                    $range = 1; 
                    $condition =~ /(.*),(.*)s/; 
                    $start = $1; 
                    $end = $2; 
                    $regex_start = 0; 
                    $regex_end = 0; 

                    if ($start =~ s/\///g) {
                        $start =~ s/\///g; 
                        $regex_start = 1; 
                    }

                    if ($end =~ s/\///g) {
                        $end =~ s/\///g; 
                        $regex_end = 1; 
                    }
                }
                if (substr($condition, 0, 1) eq '/' and $condition =~ /^\/[^\/]+\/[^\/]+\/[^\/]+\/[^\/]+/) {
                  #  print "hi\n"; 
                    $condition =~ /^\/([^\/]+)\//;
                    $address = $1; 
                    $regex_add = 1; 
                    $condition =~ s/^[^s]+//;
                }
            }
            $last = substr($condition, -1); 
            $condition =~ s/^s//; 
            $condition =~ /^(\S)(.*)\1(.*)\1/;
            $find = $2; 
            $replace = $3; 
            $global = 0; 
          #  print "$find and $replace\n";
            if ($last eq 'g') {
                $global = 1; 
            }
            
            if ($range eq 1) {
                # only apply sed to the range 
                if ($range_on eq 0) {
                    if ($counter eq $start and $regex_start eq 0) {
                        $range_on = 1;
                    }
                    if ($line =~ /$start/ and $regex_start eq 1) {
                        $range_on = 1;
                    }
                } else {
                    if ($counter eq $end and $regex_end eq 0 ) {
                        if ($global eq 1) {
                            $line =~ s/$find/$replace/g; 
                        } else {
                            $line =~ s/$find/$replace/; 
                        }
                        $range_on = 0; 
                    }
                    if ($line =~ /$end/ and $regex_end eq 1) {
                        if ($global eq 1) {
                            $line =~ s/$find/$replace/g;
                        } else {
                            $line =~ s/$find/$replace/; 
                        }
                        $range_on = 0; 
                    }
                }

                if ($range_on eq 1) {
                    # REPLACE AND PRINT
                    if ($global eq 1) {
                        $line =~ s/$find/$replace/g; 

                    } else {
                        $line =~ s/$find/$replace/; 

                    }
                }
            
            } else {
                if ($final eq 0) {
                    if ($counter eq $address or $address eq 0 or ($line =~ $address and $regex_add eq 1)) {
                        if ($global eq 1) {
                            $line =~ s/$find/$replace/g; 

                        } else {
                            $line =~ s/$find/$replace/; 
                        }
                    }
                } else { 
                    if (eof($file)) {
                        if ($global eq 1) {
                            $line =~ s/$find/$replace/g; 
      
                        } else {
                            $line =~ s/$find/$replace/; 
                        }
                    }
                }        
                
            }
           $print = 1; 
        }
    
        #print "$condition ofjoef\n"; 
        $command = chop $condition;
       # print $command; 
        if ($command =~  'q' and  $removed{$counter} ne 1) {
           
           $limit = $condition; 
           #print "$limit\n"; 
            if ($limit =~ s/\///g) {
               $limit =~ s/\///g ; 
               $regex = 1; 
            } 
            if ($limit eq '$') {
                if (eof($input)) {
                    $quit = 1; 
                }
            } else { # ?????????? SOURCE OF ERROR POTENTIAL 
                if ($counter eq $limit or ($line =~ /$limit/ and $regex eq 1)) {
                    if ($removed{$limit} ne 1) {
                        $quit = 1;
                    }  
                }
            }

        }
    
        #print "$removed{$counter}\n"; 
        if ($command =~ 'p' and $removed{$counter} ne 1) {
            $print = 0; 
            $double = $condition; 
            if ($double =~ /,/) {
               # print "hi?"; 
                $range = 1;
                $double =~ /(.*),(.*)/; 
                $start_p = $1; 
                $end_p = $2;
                $regex_start = 0; 
                $regex_end = 0; 
                if ($start_p =~ s/\///g) {
                    $start_p =~ s/\///g; 
                    $regex_start = 1; 
                } 
                if ($end_p =~ s/\///g) {
                    $end_p =~ s/\///g; 
                    $regex_end = 1; 
                }
              #  print "start: $start_p, end = $end_p\n"
            } else {
                if ($double =~ s/\///g) {
                    $double=~ s/\///g; 
                    $regex = 1; 
                } 
            }
         #   print "$double\n"; 
            $last = 0; 
            if ($double eq '$') {
                $last = 1; 
            }

            if ($n eq 0) {
               print "$line"; 
            }
            if ($last eq 1) {
                if (eof($input)) {
                    $print = 1; 
                }
            } else {
               if ($range eq 1) {
                    if ($range_on_print eq 0) {
                        if ($counter eq $start_p and $regex_start eq 0) {
                            $range_on_print = 1;
                        }
                        if ($line =~ /$start_p/ and $regex_start eq 1) {
                            $range_on_print = 1;
                        }                    
                    } else {
                        # ??? these if statements ain working 
                        if ($regex_end eq 0 and $counter eq $end_p) { # fix thisssssss !!! 
                        #   print "hello ---------------"; 
                            print  "$line";
                            $range_on_print = 0;                             
                            
                        }
                        if ($line =~ /$end_p/ and $regex_end eq 1) {
                            print  "$line";
                            $range_on_print = 0; 
                        }                    
                    }
                    #print "range on print: $range_on_print\n"; 
                    if ($range_on_print eq 1) {
                        $print = 1; 
                    }
                } else { #or ($line =~ /$double/ and $regex_add eq 0)
                    if ($line =~ /$double/ and $regex eq 1 and $last eq 0) {
                        $print = 1; 
                    }

                    if ($counter eq $double and $regex eq 0 and $last eq 0) {
                        $print = 1; 
                    }

                    if ($ARGV[0] eq 'p' and $last eq 0 ) {
                        $print = 1; 
                    }       
                } 
            }
            
        }
       # print "$condition\n"; 
        if ($command =~ 'd') {
            $delete =  $condition;
            $len = length($delete); 
           # print "$len\n"; 
            if ($len eq 0) {
                $none = 1; 
            }
            if ($delete =~ /,/) {
                $range = 1; 
                $delete =~ /(.*),(.*)/; 
                $start = $1; 
                $end = $2;
                $regex_start = 0; 
                $regex_end = 0; 
                if ($start =~ s/\///g) {
                    $start =~ s/\///g; 
                    $regex_start = 1; 
                } 
                if ($end =~ s/\///g) {
                    $end =~ s/\///g; 
                    $regex_end = 1; 
                } 
            } else {
                if ($delete =~ s/\///g) {
                    $delete =~ s/\///g; 
                    $regex = 1; 
                } 
            }

            if ($delete eq '$') {
                $last = 1; 
            }
            $print = 0; 
            if ($last eq 1) {
                if (eof($input)) {
                    $print = 0;  
                } else {
                    $print = 1;  
                }
            }
            
            if ($range eq 1) {
                if ($range_on_del eq 0) {
                    if ($counter eq $start and $regex_start eq 0) {
                        $range_on_del = 1;
                    }
                    if ($line =~ /$start/ and $regex_start eq 1) {
                        $range_on_del = 1;
                    }

                    if ($range_on_del eq 0) {
                        $print = 1;  #update 
                    }
                } else {
                    if ($counter eq $end and $regex_end eq 0 ) {
                        $range_on_del = 0; 
                    }
                    if ($line =~ /$end/ and $regex_end eq 1) {
                        $range_on_del = 0; 
                    }
                }
            } else {
                if ($counter ne $delete and $regex eq 0) {
                    $print = 1; 
                }

                if ($line =~ /$delete/) {
                    $hi = 1; # fix this  
                } else {
                    $print = 1;
                }
            }
            if ($print eq 0) {
                $removed{$counter} = 1;
            }
        }  
    }
    if ($print eq 1 and $none eq 0) {
        print "$line";
    }
    
    if ($quit eq 1) {
        last; 
    }
    $counter = $counter + 1; 
}
open my $input, ">", "input.txt" or die; 
close $input; 