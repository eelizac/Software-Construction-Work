#!/usr/bin/perl -w
# takes pathname of directory and prints a shell cript
# which hen run recreates all the directories and files in the 
# directory tree 
sub shell {
    my ($object) = @_;
 #   print "$object"; 
    if (-d $object) { # create an object 
        print"mkdir $object\n"; 
        # call it again for each object IN directory 
        shell($_) foreach glob "$object/*" ; # match things in it 
    } else {
        # it is a filename 
        print "echo -n '";
        open my $g, '<', $object or die "can not open $object: $!";
        print <$g>;
        close $g;
        print "' >$object\n";
    }
}

foreach $element (@ARGV) {
    shell $element; 
}
    