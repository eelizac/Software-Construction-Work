#!/bin/sh 

# prints the name of file sin directory and pslits into 3 categories 
# three lines of oupt 
# alphabetical 
SMALL=""
MEDIUM=""
LARGE=""

for file in *
do     
    # count how many lines there are in the file 
    # correspondingly increment each variable 
    LINES=$(wc -l "$file" | cut -d ' ' -f1) 

    if test $LINES -lt 10 
    then 
        SMALL+=" $file"
    elif test $LINES -lt 100 
    then
        MEDIUM+=" $file"
    else 
        LARGE+=" $file"
    fi

done 

# sort them 

sort_small=$(echo $SMALL | sort)
sort_medium=$(echo $MEDIUM | sort)
sort_large=$(echo $LARGE | sort)


# print out results 

echo "Small files: $sort_small"
echo "Medium-sized files: $sort_medium"
echo "Large files: $sort_large"
