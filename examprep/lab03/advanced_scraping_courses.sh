#!/bin/sh 
# Error checking
if [ "$#" -ne 2 ]; then 
    echo "Usage: scraping_courses.sh <year> <course-prefix>"
    exit 1
elif [ $1 -gt 2021 ]; then 
    echo "scraping_courses.sh: argument 1 must be an integer between 2019 and 2021"
    exit 1
fi 

YEAR=$1
PREFIX=$2

if [ $YEAR -lt 2019 ] && [ $YEAR -gt 2005 ]; then #old handbook 
    page1=$(curl -sL http://legacy.handbook.unsw.edu.au/vbook${YEAR}/brCoursesByAtoZ.jsp?StudyLevel=Postgraduate&descr=${PREFIX})
    page2=$(curl -sL http://legacy.handbook.unsw.edu.au/vbook${YEAR}/brCoursesByAtoZ.jsp?StudyLevel=Undergraduate&descr=${PREFIX})
    echo $page1 | 2041 pup -p 'table.tabluatedInfo td text{}' | tr -d '\240'  | sed 's/\xC2//g' | tr -s '\n' | sed -E ' 3~3d; N;s/\n/ /' | sort | uniq
else
    page1=$(curl -sL https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:${YEAR}%20+unsw_psubject.studyLevel:undergraduate%20+unsw_psubject.educationalArea:${PREFIX}*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:ugrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0)
    page2=$(curl -sL https://www.handbook.unsw.edu.au/api/content/render/false/query/+unsw_psubject.implementationYear:${YEAR}%20+unsw_psubject.studyLevel:postgraduate%20+unsw_psubject.educationalArea:${PREFIX}*%20+unsw_psubject.active:1%20+unsw_psubject.studyLevelValue:pgrd%20+deleted:false%20+working:true%20+live:true/orderby/unsw_psubject.code%20asc/limit/10000/offset/0)
    echo "$page1" "$page2" | 2041 jq -r '.["contentlets"][] | (.code + " " + .title)' | sort | uniq
fi 

