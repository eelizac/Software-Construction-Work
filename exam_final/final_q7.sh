#!/bin/dash 

#num=$(ls | wc -l)
##if [ $num -eq 0 ] >/dev/null 
#then 
 #   echo "No Commits"
  #  exit 1
#fi 
if [ -d .git ]; then
    status=$(git status)
    check_inital=$(echo "$status" | grep 'Initial' | wc -l)
    if [ $check_inital -ne 0 ]; then 
        echo "../final_q7.sh: No Commits"
        exit 1
    fi 
   # echo "hiiiiii"
    page=$(git log) 
    #error="fatal: your current branch 'master' does not have any commits yet"
    echo -n "Last Commit Date: "
    echo "$page" | egrep 'Date' | head -1 | cut -d' ' -f4-9

    echo "Number of Commits per Author:"
    echo "$page" | egrep 'Author' | sed 's/<.*//;s/Author: //' | sort | uniq -c | sort -r
else
    echo "./final_q7.sh: Not a git repository"
fi
