#!/usr/bin/perl

# single speed command as a command line argument 
# 'q' 'p' 'd' or 's' --> or -n 
# read from stdin 
$commands = $ARGV[0];
if ($commands eq '-f') {
    $flag = 1; 
    $commands_file = $ARGV[1];

    open my $f, "<", "$commands_file"; 
    for ($line = <$f>) {
        $commands = $line ;
    }
 # print "$condition\n"; 
    while ($line = <$f>) {
        $commands = $commands . "$line";
    }
  #print "$condition\n";
}
#input stuf 
if (@ARGV > 2) {
    $i = 1;
    if ($flag eq 1) {
        $i = 2; 
    }
   # print "$i\n"; 
    open my $input, ">>", "input.txt" or die;  
    while ($i <= $#ARGV) {
        open my $f, "<", "$ARGV[$i]" or die; #read 
        while ($line = <$f>) {
            print {$input} $line; 
        } 
        $i = $i + 1; 
    }
} else {
    $input = STDIN; 
}


if ($commands =~ /#/) {
    # get rid of the space space 
    $commands =~ s/#[^;\n]*//g;   
}
# get rid of white space 
$commands =~ s/ //g; 
$commands = ";" . $commands ; 

$num = 1 ;
open my $input, "<", "input.txt" or die;  #read 
open my $file, ">" , "$num.txt" or die ; #write 
while ($line = <$input>) {
    print {$file} $line; 
}
close $file; 
close $input; 


$num = $num +  1; 
while ($commands =~ /[;\n]/) {
    $commands =~ /^(.*)[;\n](.*)$/; 
    $condition = $2;  
    open my $file2, ">", "$num.txt" or die; #write 2
    $prev = $num - 1; 
    open my $file, "<" , "$prev.txt" or die; #read 1
    # INSERT THE THINGS FOR EACH COMMAND 
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
            #   print "hi"; 
        } else {
        
            if ($condition =~ /,/) {
                # range 
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
            # INCLUDE NON WHITE SPACE CHARACTER TO DELIMIT HERE !! FOR ADDRESS AND RANGE 
            if (substr($condition, 0, 1) eq '/') {
            # it is a regex 
        #     print "$condition\n"; 
                $condition =~ /^\/([^\/]+)\//;
                $address = $1; 
                $regex_add = 1; 
                $condition =~ s/^[^s]+//;
            }
        }
        # get what you want to replace 
        # get rid of the s 
        $last = substr($condition, -1); 
        $condition =~ s/^s//;
    #  print "$condition\n"; 
        $condition =~ /^(\S)(.*)\1(.*)\1/;
        $find = $2; 
        $replace = $3;
    #  print "$find and $replace\n"; 
        $command = chop $condition; # ????????????????? what 
        $global = 0; 
        if ($last eq 'g') {
            $global = 1; 
        }
        $counter = 1; 
        $range_on = 0; 
        while ($line = <$file>) {
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
                # print "hi"; 
                    if (eof($file)) {
                    # print "$find and $replace\n"; 
                        if ($global eq 1) {
                            $line =~ s/$find/$replace/g; 
                        } else {
                            $line =~ s/$find/$replace/; 
                        }
                    }
                }        
                
            }
        
            print {$file2} "$line";
            $counter += 1; 
        }

    }


    $command = chop $condition;
    if ($command eq 'n') {
        $comm= chop $ARGV[1];
        if ($comm eq 'p') {
            $print = 1; 
            $double = $ARGV[1]; 
        
            $double =~ s/\///g; 
            $last = 0; 
            if ($double eq '$') {
                $last = 1; 
            }
            $counter = 0; 
            #print 
            while ($line = <$file>) {
                $counter += 1; 
                if ($last eq 1) {
                    if (eof($file)) {
                        print {$file2} "$line"; 
                    }
                } else {
                    if ($counter eq $double or $line =~ /$double/ or length($ARGV[0]) eq 1) {
                    print {$file2} "$line"; 
                    }
                }
    
            }
        }
    }

    if ($command eq 'q') {
        $quit = 1; 
        $limit = $condition; 
        $regex = 0; 
        if ($limit =~ s/\///g) { 
            $limit =~ s/\///g; 
            $regex = 1; 
        } # get rid of slashes 
        $counter = 0; 
        while ($line = <$file>) {
            
            if ($counter eq $limit) {
                last; 
            }

            print {$file2} "$line"; 
            $counter += 1; 
            if ($line =~ /$limit/ and $regex eq 1) { # fix this 
                last; 
            }
        }
    } 


    if ($command eq 'p') {
        $print = 1; 
        $double = $condition; 
        $range = 0; 
        if ($double =~ /,/) {
            $range = 1;
            $double =~ /(.*),(.*)/; 
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
            if ($double =~ s/\///g) {
                $double=~ s/\///g; 
                $regex = 1; 
            } 
        }
        #$double =~ s/\///g; 
        $last = 0; 
        if ($double eq '$') {
            $last = 1; 
        }
        $counter = 0; 
        #print 
        $prevline = 0; 
        $range_on = 0; 
        while ($line = <$file>) {
            print {$file2} "$line"; 
            $counter += 1; 
            if ($range eq 1) {
                if ($range_on eq 0) {
                    if ($counter eq $start and $regex_start eq 0) {
                        $range_on = 1;
                    }
                    if ($line =~ /$start/ and $regex_start eq 1) {
                        $range_on = 1;
                    }
                } else {
                    if ($counter eq $end and $regex_end eq 0 ) {
                        print {$file2} "$line"; 
                        $range_on = 0; 
                    }
                    if ($line =~ /$end/ and $regex_end eq 1) {

                        print {$file2} "$line";
                        $range_on = 0; 
                    }
                }
                if ($range_on eq 1) {
                    print {$file2} "$line";
                }
            
            } else {
                if (($counter eq $double or $line =~ /$double/ or length($ARGV[0]) eq 1) and ($last eq 0)) {
                    print {$file2} "$line"; 
                }            
            }

            $prevline = $line;  
        }

        if ($last eq 1) {
            print {$file2} "$prevline"; 
        }
    }

    # DELETE COMMAND 
    if ($command eq 'd') {
    #   print "hi\n"; 
        $delete = $condition; 
        $counter = 0; 
        $regex = 0; 
        # a range - start and finish 
        $range = 0; 
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

        $last = 0; 
        if ($delete eq '$') {
            $last = 1; 
        }
        $range_on = 0;
        while ($line = <$file>) {
            $counter += 1; 
            if ($last eq 1) {
                if (eof($file)) {
                    last; 
                } else {
                    print {$file2} "$line"; 
                }
            } 
            if ($range eq 1) {
                if ($range_on eq 0) {
                    if ($counter eq $start and $regex_start eq 0) {
                        $range_on = 1;
                    }
                    if ($line =~ /$start/ and $regex_start eq 1) {
                        $range_on = 1;
                    }

                    if ($range_on eq 0) {
                        print {$file2} "$line";
                    }
                } else {
                    if ($counter eq $end and $regex_end eq 0 ) {
                        $range_on = 0; 
                    }
                    if ($line =~ /$end/ and $regex_end eq 1) {
                        $range_on = 0; 
                    }

                }

            } else {
                if ($counter ne $delete and $regex eq 0) {
                    print {$file2} "$line"; 
                }

                if ($line =~ /$delete/) {
                    $hi = 1; # fix this  
                } else {
                    print {$file2} "$line"; 
                }
            }

        }
    }

    # END OF INSERTION

    $commands = $1; # next one 
    $num = $num + 1; 
}

# PRINT THE OUTPUT  
$num = $num - 1; 
open my $file, "<", "$num.txt" or die;
while ($line = <$file>) {
    print $line; 
}

open my $input, ">", "input.txt" or die; # CLEAR IT 
close $input;

# -------------------------------------
#if ($condition =~ /;/) {
    # multiple commands 
#    $condition =~ s/;(.*)$//; 
##    $next_condition = $1; 
#    print "$next_condition\n"; 
##    print "$condition\n";
 #   $multiple_commands = 1;  
#}


#substr($condition, 0, 1) eq 's' or substr($condition, 1, 1) eq 's'
# substitution command 
