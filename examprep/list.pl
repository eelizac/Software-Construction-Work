#!/usr/bin/perl
# Write some perl functions that manipulate arrays 

# first make a list 
sub make_list {
    while (<>) {
        push @a, $_; 
    } 
    return @a  ;  
}
# function to print list 
sub print_list {
    my @list = @_; 
    print "print list function\n"; 
    foreach $element(@list) {
        print $element; 
    } 
}
# sums up the list 
sub sum {
    my @list = @_; 
    $total = 0 ;
    foreach $element(@list) {
        $total += $element; 
    } 
    return $total;
}

sub reverse_list {
    my @list = @_; 
    
    foreach $element(@list) {
        unshift @3w, $element 
    } 
    return @new;
}

# is an element an odd number 
sub odd_numbers {
    my $num = @_; 
    print ' i a here';
    print "$num   "; 
}


sub square {
    my @list = @_; 
    
    foreach $element(@list) {
        $sq = $element**2 ;
        push @new, $sq ;
    } 
    return @new;
}

@list = make_list();  
print_list @list; 
$sum = sum @list; 
print "sum: $sum\n";

@reverse = reverse_list @list; 
print_list @reverse; 
print "square\n";
@squar = square @list; # fix square 
print_list @squar; 
#foreach $element (@list) {
    #print $element; 
 #   odd_numbers $element; 
#}