#!/usr/bin/perl
$commands = $ARGV[0];
# commands 
if ($commands eq '-f') { 
    $flag = 1; 
  $commands_file = $ARGV[1];
 # print $commands_file; 
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
# input 
if (@ARGV > 1) {
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

$num = 1 ;
close $input; 
open my $input, "<", "input.txt" or die;  #read 
open my $file, ">" , "$num.txt" or die ; #write 
$commands = ";" . $commands ; 
# put everything in a file 
while ($line = <STDIN>) {
    print {$file} $line; 
}

#print "$commands\n"; 
close $input; 
close $file; 
$num = $num + 1; 
$commands =~ /^(.*)[;\n](.*)$/; 
$condition = $2;  

open my $file2, ">", "$num.txt" or die; #write 2
$prev = $num - 1; 
open my $file, "<" , "$prev.txt" or die; #read 1
while ( <$file>) {
    print {$file2} $_; 
}



open my $file, "<", "$num.txt" or die; #read
while ($line = <$file>) {
    print $line; 
}
#open my $input, ">", "input.txt" or die; # CLEAR IT 
#close $input;
