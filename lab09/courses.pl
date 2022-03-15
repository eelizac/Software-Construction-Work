#!/usr/bin/perl


$course = $ARGV[0];

$url = "http://www.timetable.unsw.edu.au/current/${course}KENS.html";


$webpage = `wget -q -O- $url`;

$webpage =~ s/\n//g; # remove new lines 

$webpage =~ s/\s+//g; # removes white space 

@course_name = $webpage =~ /html">([^<]*)</g;
@final; 

$range = $#course_name - 1;

for my $i (2 .. $range) {
    $add = $i + 1;
    $newstring = join(' ', @course_name[$i..$add]);

    # insert spaces 
    $newstring =~ s/[A-Z][a-z]+(?!\W+)\K/ /g;
    $newstring =~ s/of/ of/g;
    $newstring =~ s/and/ and/g;
    $newstring =~ s/the/ the/g;
    $newstring =~ s/:/: /g;
    $newstring =~ s/from/ from/g;
    $newstring =~ s/a thematics/athematics/g;
 
    $odd = $i % 2; 
    if ($odd eq 0) {
       push @final, $newstring;  
    }

}
# check for duplicates 
my %hash = map {$_ => 1} @final; 
my @unique = keys %hash;

foreach (sort @unique) {
    print "$_\n"; 
}
