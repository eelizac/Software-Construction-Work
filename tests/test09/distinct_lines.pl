#!/usr/bin/perl

# given single argument n reads line from standrd input until 
# n different lines have been read 
$n = $ARGV[0]; 
$counter = 0; 
%line_count;
while ($line = <STDIN>) {
   # print("$n\n $line\n %line_count\n");
   # print ("$size");
    $line = lc $line; # case 
    $line =~ s/^\s+//; #leading white space
    $line =~ s/\s+$//; #trailing 
    $line =~ s/\s+/\s/; #trailing 
    if (exists $line_count{$line}) {
        $line_count{$line} += 1; 
    } else {
        $line_count{$line} = 1; 
    }
    $counter += 1; 
    $size = keys %line_count; 
    if ($size eq ($n)) {
        last; 
    }
}

if ($size ne $n) {
    print "End of input reached after $counter lines read - $n different lines not seen.\n"
} else {
    print "$n distinct lines seen after $counter lines read.\n"   
}
