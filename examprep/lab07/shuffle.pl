#!/usr/bin/perl -w
@lines = <>;
print splice(@lines, rand(@lines), 1) while @lines;