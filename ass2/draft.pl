#!/usr/bin/perl
$condition = $ARGV[0];
if (@ARGV > 1) {
  print "Hi\n"; 
}
if ($condition eq '-f') {
  $commands_file = $ARGV[1];
 # print $commands_file; 
  open my $f, "<", "$commands_file"; 
  for ($line = <$f>) {
    $condition = $line ;
  }
 # print "$condition\n"; 
  while ($line = <$f>) {
      $condition = $condition . "$line";
  }
  #print "$condition\n";
}
$num = 1 ;
open my $file, ">" , "$num.txt" or die ; #write 
$condition = ";" . $condition ; 
# put everything in a file 

while ($line = <STDIN>) {
    print $file $line; 
}
close $file; 
$num = $num +  1; 
# print "$condition\n"; 
while ($condition =~ /[;\n]/) {
    $condition =~ /^(.*)[;\n](.*)$/; 
    $current_condition = $2;  
   # print "$current_condition"; 
    open my $file2, ">", "$num.txt" or die; #write 2
    $prev = $num - 1; 
    open my $file, "<" , "$prev.txt" or die; #read 1
    
   # print "$current_condition\n"; 
    
    $counter = 0; 
    while ($line = <$file>) {
        print {$file2} $line; 
        $counter =+ 1; 
    }
    
    print {$file2} "I AM HERE\n"; 
  #  close $file; 
  #  close $file2; 
    $condition = $1;
   
    $num = $num + 1; 
      #print "NUVDNF $num\n";
}
    
    $num = $num - 1; 
  #  print "$num"; 
    open my $file, "<", "$num.txt" or die;
    while ($line = <$file>) {
        print $line; 
    }
   # print "$condition\n"; 