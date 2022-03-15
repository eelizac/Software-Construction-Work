#!/usr/bin/perl -w

sub options {
    my ($n) = @_; 
  #  print "$n";
    $l = "";
    if ($n == 2) {
        $l = "abc";
    } elsif ($n == 3) {
        $l = "def"
    } elsif ($n == 4) {
        $l = "ghi"
    } elsif ($n == 5) {
        $l = "jkl"
    } elsif ($n == 6) {
        $l = "mno"
    } elsif ($n == 7) {
        $l = "pqrs"
    } elsif ($n == 8) {
        $l = "tuv"
    } elsif ($n == 9) {
        $l = "wxyu"
    }
    return "[".$l."]"
}

sub lookup {
    my ($str) = @_; 
    print "@_"; 
    open my $f, '<', $ARGV[0] or die "can not open"; 
    while (my $line = <$f>) {
        if ($line =~ /\b$str\b/) {
           # if (length($line)
           $a = chop $line ;
           push @match, $line;
        }
    }
    close $f; 
  # print "@match\n"; 
   # return @match; 
   
   return join(' ', @match); 
}

#@charoptions; -- FULL STRING  
foreach $num (split //, $ARGV[1]) {
    push @charoptions, options $num;; 
}

$string = $string = join('', @charoptions); 
#lookup $string; 
# do all the options now 
$i = 1;
$length = @charoptions - 1;
print "STRING - $string\n"; 
while ($i <= $length ) {
    $string1 = substr($string, 0, ($i * 5)); 
    print "$string1 -- \n"; 
   #print "$i 's TURN\n"; 
    $one = lookup $string1; 
    $string2 = substr($string, ($i * 5) , $length * 5 + 1); 
    $two = lookup $string2; 
    print " in $i we have $one and $two\n"; 
    $i = $i + 1; 
  #  lookup $string; 
}




