#!/bin/bash

# You have a file called user.txt with entries that contain username, password, group, shellToUse.
# You need to create system users by reading the entries in this file with a Bash script.
# Try to use mapfile or IFS Bash commands.
# Martin Sidorov
# LOGITgv19

FILENAME="users.txt"

while IFS=',' read USERNAME PASSWORD GROUPNAME SHELLTOUSE
do

    # Add user and assign shell and group
    echo " "
    echo "ADDING USER: " $USERNAME "WITH GROUP" $GROUPNAME "AND SHELL" $SHELLTOUSE
    sudo groupadd $GROUPNAME
    sudo useradd -m -s $SHELLTOUSE -g $GROUPNAME $USERNAME
    # Add password for user
    echo -e "$USERNAME:$PASSWORD" | sudo chpasswd

    id $USERNAME

done < "$FILENAME"
echo " "
echo "DONE"
