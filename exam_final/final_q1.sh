#!/bin/dash 
cut -d'|' -f4 | cut -d'/' -f1  | grep 3711 | wc -l 