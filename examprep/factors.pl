#!/usr/bin/perl

sub factors {
    my ($num) = @_;
    $i = 2; 
    while ($num != 1) {
        #my $num--; 
        while ($num % $i == 0) {
            push @array, $i ;
            $num = $num / $i; 
        }
        $i++; 
    }
    return @array;
}
$x = 20;
@ret = factors($x); 
print "@ret\n";