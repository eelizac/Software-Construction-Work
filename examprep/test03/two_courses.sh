#!/bin/sh

cut -d'|' -f2  | sort | uniq -c | sort -r | grep '2 ' | cut -d' ' -f8 | sort