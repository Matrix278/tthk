#!/bin/bash
# Martin Sidorov
# LOGITgv19

# Skriptimisvahendid:
# Script periodically checks that file exists and controls that the file size is greater than 0.
# If the file size is equal to 0 and the file is not locked script deletes the file.

echo "Right now, you are in $(pwd) directory"
echo ""
echo "Write down any file that you want to check(for example: folder/test.txt):"

read file
echo ""

while :
do [ ! -f "$file" ] && ( echo "File does not exist")
    if [ ! -n "$(lsof "$file")" ]; then
        if [ -s $file ]; then
            echo "File $file size is greater than 0"
        else
            rm $file
            if [ $? -eq 0 ]; then
                echo ""
                echo "File $file has been deleted, because the size of the file is lower than 0"
                exit
            else
                echo ""
                echo "Script ends here because this file doesn't exist"
                exit
            fi
        fi
    else
        echo "File $file is in use right now, please close it"
    fi
    sleep 5
done
