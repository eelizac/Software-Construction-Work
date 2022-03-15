#!/bin/sh 

if test $# -ne 2 
then 
    echo "Usage: ./scraping_courses.sh <year> <course-prefix>"
    exit 1
fi

if test $1 -eq $1 2> /dev/null
then 
    : 
else
    echo "./scraping_courses.sh: argument 1 must be an integer between 2019 and 2021"
    exit 1 
fi 

if test $1 -lt 2019 || test $1 -gt 2021 
then 
    echo "./scraping_courses.sh: argument 1 must be an integer between 2019 and 2021"
    exit 1
fi 


if test ${#2} -eq 1
then 
    page1=$(curl -sL https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:2021%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:COMP*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0)
    page2=$(curl -sL https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:2021%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:COMP*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0)
    echo "$page1" "$page2" | 2041 jq ".contentlets[] | select(.implementationYear==\"$year\") | select(.educationalArea | startswith(\"$course\"))" | 2041 jq '.code + " " + .title' | tr -d \" | sort | uniq
else 
    page1=$(curl -sL https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:2021%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:COMP*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0)
    page2=$(curl -sL https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:2021%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:COMP*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0)
    echo "$page1" "$page2" | 2041 jq ".contentlets[] | select(.implementationYear==\"$year\")" | 2041 jq '.code + " " + .title' | tr -d \" | sort | uniq

fi

