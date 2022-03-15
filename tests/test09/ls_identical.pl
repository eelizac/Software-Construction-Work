#!/usr/bin/perl
#use Array::Utils qw(:all);
# takes pathname of 2 directories as args 
# print in alphabetical order the names of all files which occur in both dirs
# smae contents for their names to be printed 
#$dir1 = $ARGV[0]; 
opendir my $dir1, "$ARGV[0]"; 
@a1 = readdir $dir1; 
closedir $dir1; 
#print "@array1\n"; 
# put directory 1 files in array 1 
opendir my $dir2, "$ARGV[1]"; 
@a2 = readdir $dir2; 
closedir $dir2; 
##print "@array2\n"; 
# put directory 2 files in array 2 


foreach $wrkelement (@a1, @a2) { $count{$element}++ }
foreach $element (keys %count) {

    if ($count{$element} > 1 ) {
        $counter = 0; 
    } else {
        print "$element";
    }
    push @{ $count{$element} > 1 ? \@Intersection : \@Difference }, $element;
}

print("@Difference\n");

@diff1{ @a1 } = @a1;
delete @diff1{ @a2 };
# %diff1 contains elements from '@a1' that are not in '@a2'

@diff2{ @a2 } = @a2;
delete @diff2{ @a1 };
# %diff2 contains elements from '@a2' that are not in '@a1'

@k = (keys %diff1, keys %diff2);
#print "@k";