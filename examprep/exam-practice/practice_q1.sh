#!/bin/dash
cut -d'|' -f3  | sort | uniq | cut -d',' -f2 | cut -d' ' -f2 | sort 