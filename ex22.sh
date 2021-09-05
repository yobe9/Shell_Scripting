#!/bin/bash
# Yoav Berger

# check the number of arguments given by user
if test "$#" -ne 4  ; 
    then echo "Not enough parameters"
    exit  0 
fi

# getting the path of the script: (>/dev/null 2>&1)  so cd wont interfere with the surrounding, (--) in case directory starts with '-'
SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
#echo $SCRIPTPATH

# get inside the given directory so we will be able to serch in it
cd $1
#./ex21.sh Temp/ txt world

#find -type d
# serch for the argument in the directory in lexicographical order
for dir in $(find -type d | sort)
do
    #echo "$dir"
    $SCRIPTPATH/ex21.sh "$dir" "$2" "$3" | awk -v var=$4 'NF>=var {print}' | sort
    
done

# return to original directory for next test
#cd $SCRIPTPATH
