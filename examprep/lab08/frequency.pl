#!/usr/bin/perl -w
$needed = $ARGV[0];
foreach $file (glob "lyrics/*.txt") {
    $counter_word = 0; 
    $counter = 0;
 #   shift @ARGV; 
    open $f, '<', $file or die "cannot open $file\n"; 
    while ($line = <$f>) {
     #  print "$line"; 
        @words = split(/[^a-zA-Z]+/, $line);
        foreach $word (@words) {
            $word = lc $word; 
            $counter_word++ if $word eq $needed;
            $counter++ if $word ne '';
        }
    }
    close $f; 
    $ratio = $counter_word / $counter;
    $file =~ s/^.*\///;
    printf "%4d/%6d = %.9f %s\n", $counter_word, $counter, $ratio, $file; 
 #   print "$counter_word / $counter = $ratio $file"
}