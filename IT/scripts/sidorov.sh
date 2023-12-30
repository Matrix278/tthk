#!/bin/bash
# Martin Sidorov
# LOGITgv19

# DATETIME FORMAT CHEATSHEET https://www.tutorialkart.com/bash-shell-scripting/bash-date-format-options-examples/
local DATECHECK=$(date +"%S")
local DATE=$(date +"%H::%M::%S")
local DATE_IN_ENGLISH=$(date +"%d.%B")
local DATE_WEEKDAY=$(date +"%A")
local DATE_NUM=$(date +"%u")

# SCRIPTNAME
local SCRIPTNAME="$(whoami).sh"

# MATH EXPRESSION

echo "Hello $(whoami)"
echo "Your group ID is: $(id -g "$(whoami)")"
grep "$(whoami)" /etc/passwd > /dev/null
if [[ "$?" -eq "0" ]];
then
    echo "User $(whoami) exists in /etc/passwd file"
else
    echo "Didn't find user $(whoami) in /etc/passwd"
fi

echo "$DATE_IN_ENGLISH"

if [[ "$DATECHECK" > "30" ]];
then
    echo "$DATE_WEEKDAY"
else
    echo "$DATE_NUM"
fi

if [ -d "/home/$(whoami)/test/" ] 
then
    echo "Directory /home/$(whoami)/test/ exists." 
else
    echo "Path /home/$(whoami)/test/ doesn't exists. Creating it."
    mkdir -p /home/$(whoami)/test/
fi

sudo ps -ef | grep "root" > /home/$(whoami)/test/martin.txt

read -p 'Insert three numbers: ' num1 num2 num3
let " SUM = $num1 + $num2 + $num3"
let " AR_MEAN = $SUM / 3 "

echo "Your summary is: $SUM"
echo "Your arithmetic mean is: $AR_MEAN"
local END_DATE=$(date "+%S")

echo "Script runtime is $END_DATE."
