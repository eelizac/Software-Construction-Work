#!/usr/bin/perl -w
# dictionary to determine which words match possible letters
# name of file containing dictionary - STDIN
# OCR text as lines of words sepverated by spaces
sub lookup {
    my ($word) = @_; 
    # replace all ( with [ 
    $original = $word; 
    $word =~ s/\(/\[/g; 
    $word =~ s/\)/\]/g; 
  #  print "$word "; 
    my @match; 
    open my $f, '<', $ARGV[0] or die "can not open"; 
    while (my $line = <$f>) {
        if ($line =~ /\b$word\b/) {
           # if (length($line)
           $a = chop $line ;
            push @match, $line
        }
    }
    close $f; 
    if (@match eq 1) {
        return join( '', @match );
    } elsif (@match eq 0) {
        return $original;
    } else {
        $string_ret = join( ',', @match );
        return '{'.$string_ret.'}'
    }
}



while ($line = <STDIN>){ 
    @words = split(/\s+/, $line); 
    foreach $word (@words) {
      #  print " -- $word-- "; 
        if ($word =~ /\(/) {
         #   print "$word "; 
            $new = lookup $word; 
            print "$new "; 
        } else {
            print "$word "; 
        }
    }
    print "\n"; 
}