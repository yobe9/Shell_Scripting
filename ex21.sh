#!/bin/bash
# Yoav Berger

# check the number of arguments given by user
if test "$#" -ne 3  ; 
    then echo "Not enough parameters"
    exit  0 
fi

# get inside the given directory so we will be able to serch in it
cd $1

# serch for the argument in the directory in lexicographical order, flags: h - show only the content , w - only full word, i - ignore case sensative
grep -hiw $3 *.$2  | sort
