#!/bin/dash

cut -d'|' -f2 | sort | uniq -c | egrep '^ *2' | cut -d' ' -f8