#!/bin/bash

#Skriptimisvahendid:
# kodutöö - Create a script using the following instructions:
# Ask user to fill in an array with 10 elements.
# Display all elements of the array one by one using for loop.
# Change first and last elements of the array by values entered by user on demand from the script.

echo "Martin Sidorov"
echo "LOGITgv19"
echo ""

declare -a numberDefinitions=("First" "Second" "Third" "Fourth" "Fifth" "Sixth" "Seventh" "Eighth" "Ninth" "Tenth")

echo "Write down 10 or less numbers separating them with space to store in array(for example: 1 2 3):"

read -a arr

echo ""
echo "----------------------------------------"
echo ""

# Print all array one by one with for loop
counter=0
for i in ${arr[@]}
do
    if [ $counter -lt 10 ]; then
        echo ${numberDefinitions[$counter]} "value: $i"
    else
        echo ""
        echo "Numbers in array should be only 10 as the task is saying, so I will exit right now and you will need to try again"
        exit 1
    fi
    ((counter++))
done
# Print all array one by one with for loop

echo ""
echo "----------------------------------------"
echo ""

# First element change
echo "Write one number that you want to change in first element of your array:"

read newFirstElement

arr[0]=$newFirstElement

echo "First element of array is now: ${arr[0]}"
# First element change

echo ""
echo "----------------------------------------"
echo ""

# Second element change
echo "Write one number that you want to change in last element of your array:"

read newLastElement

arr[-1]=$newLastElement

echo "Last element of array is now: ${arr[-1]}"
# Last element change

echo ""
echo "----------------------------------------"
echo ""

# Print all new array
echo "All new array:"
printf '%s\n' "${arr[@]}"