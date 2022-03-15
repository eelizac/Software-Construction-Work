#!/bin/dash

 # takes on names of files are arugments 
 # prints commands to replace some with symbolic link 
files_printed=()

for file in "$@"; do
   # if [[ " ${files_printed[@]} " =~ " ${file} " ]]; then
   #     echo "am i here yet"
   #     continue 
   # fi 
   printed=0
    for x in "${file_printed[@]}"; do 
        if [ "$x" == "$file" ]; then 
            printed=1
        fi 
    done

    if [ $printed -eq 1 ]; then
        continue  
    fi 

    arr_file=()
    file1=$(cat $file)
    arr_file+=("$file")
    for compare_file in "$@"; do
        file2=$(cat $compare_file)
        if [[ "$file" == "$compare_file" ]]; then 
            continue 
        fi 
        if [[ "$file1" == "$file2" ]]; then 
            arr_file+=("$compare_file")
        fi 
    done 
    # print it 
    if [ "${#arr_file[@]}" -eq 1 ]; then 
        echo -n "ln -s "
        for value in "${arr_file[@]}"; do
            file_printed+=($value)
            echo -n "$value "
        done
        echo ""
    elif [ "${#arr_file[@]}" -gt 2 ]; then 
        echo -n "ln -s "
        for value in "${arr_file[@]}"; do
            file_printed+=($value)
            echo -n "$value "
        done
        echo ""
    fi
done
 #   for x in "${file_printed[@]}"; do 
#        echo "$x"
#    done
  #  echo " --- $file_printed"