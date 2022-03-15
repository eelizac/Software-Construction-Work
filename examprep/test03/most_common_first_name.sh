#!/bin/sh

egrep '2041|9044'| cut -d'|' -f3 | cut -d',' -f2 | sort | uniq | cut -d' ' -f2 | uniq -c| sort -r | head -1 | cut -d' ' -f8