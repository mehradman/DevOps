#!/bin/bash

# Prompt user to enter User ID
echo "Enter the User ID to analyze his/her actions:"
read user_id

# Check if the User ID exists in the log file
if ! grep -q ",$user_id," audit.log; then
    echo "Error: User ID $user_id not found in the log file."
    exit 1
fi

# Display the header for the summary
echo "SUMMARY OF ACTIONS OF USER $user_id"
echo "=================================="

# Calculate and display the total count of actions by the user
awk -F ',' -v user="$user_id" '$2 == user {count++} END {print "- TOTAL COUNT : "count}' audit.log

# Display the types of actions and their counts
awk -F ',' -v user="$user_id" '$2 == user {print toupper($4)}' audit.log | sort | uniq -c | awk '{print "- " $2 " : " $1}'

# Display all actions by the user
echo "- USER ACTIONS :"
awk -F ',' -v user="$user_id" '$2 == user {print "   "$0}' audit.log
