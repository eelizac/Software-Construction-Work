#!/usr/bin/perl
$commands = $ARGV[0];
if ($commands =~ /#/) {
    # get rid of the space space 
    $commands =~ s/#[^;\n]*//g;   
}
# get rid of white space 
$commands =~ s/ //g; 
print "$commands\n"; 