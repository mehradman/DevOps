#!/bin/bash

# Prompt user to enter User ID
echo "Enter the User ID to analyze his/her actions:"
read user_id

# Check if user_id is empty
if [ -z "$user_id" ]; then
  echo "User ID cannot be empty. Please enter a valid User ID."
  exit 1
fi

# Check if sample.json file exists
if [ ! -f sample.json ]; then
  echo "sample.json file not found!"
  exit 1
fi

# Check if User ID exists in the JSON file
user_exists=$(jq '[.[] | select(.userID == '"$user_id"')] | length' sample.json)
if [ "$user_exists" -eq 0 ]; then
  echo "User ID $user_id not found in sample.json"
  exit 1
fi

# Display the header for the summary
echo "SUMMARY OF ACTIONS OF USER $user_id"
echo "=================================="

total_count=$(jq '[.[] | select(.userID == '"$user_id"')] | length' sample.json)
failed_count=$(jq '[.[] | select(.userID == '"$user_id"' and .status == "failed")] | length' sample.json)
success_count=$(jq '[.[] | select(.userID == '"$user_id"' and .status == "success")] | length' sample.json)

# Fetch user actions and format them 
user_actions=$(jq -r '[.[] | select(.userID == '"$user_id"')] | .[] | [.timestamp, .userID, .action, .status] | @csv' sample.json | tr -d '"')

report_file="log_analysis_report.txt"

{
    echo "- TOTAL COUNT : $total_count"
    echo "- FAILED : $failed_count"
    echo "- SUCCESS : $success_count"
    echo "- USER ACTIONS :"
    echo "$user_actions" | awk '{print "   "$0}'
} | tee "$report_file"
