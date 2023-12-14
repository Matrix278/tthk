#!/bin/bash
# Martin Sidorov
# LOGITgv19

# Skriptimisvahendid:
# Script periodically checks that file exists and controls that the file size is greater than 0.
# If the file size is equal to 0 and the file is not locked script deletes the file.

echo "Right now, you are in $(pwd) directory"
echo "Keep in mind, your wroten directories that not exist will be created!"
echo ""
echo "Write down directory names separating them with space(for example: /path/to/dir /path/work):"

read -a arr
echo ""

areDirectoriesCreated=false
directoriesToDelete=()

# Counter for readability
counter=1
for i in ${arr[@]}
do
    if [ -d $i ]; then
        echo "$counter: Directory $i exists." 
    else
        mkdir -p $i
        echo "$counter: Directory $i does not exists. We created one for you!"
        areDirectoriesCreated=true
        arrIN=(${i//// })
        directoriesToDelete+=(${arrIN[0]})
    fi
    ((counter++))
done

echo ""

# Check if user wants to delete the created directories
if $areDirectoriesCreated ; then
    echo "Be WARNED, right now I will ask you if you want to delete them!"
    echo ""
    sleep 1.5
    read -p "Do you want to delete all your created directories (y/n)?" input

    case $input in
        [yY][eE][sS]|[yY])
            echo "Yes"
            echo ""
            for i in ${directoriesToDelete[@]}
            do
                rm -v -r $i
                if [ $? -eq 0 ]; then
                    echo "All directory of $i was succesfully removed"
                else
                    echo "Error: Directories weren't deleted"
                fi
            done
        ;;
        [nN][oO]|[nN])
            echo "No"
            exit 1
        ;;
        *)
            echo "Invalid input..."
            exit 1
        ;;
    esac
fi