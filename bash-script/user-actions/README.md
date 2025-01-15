# User Action Summary Script

## Overview
This script processes a log file (`audit.log`) to summarize and detail the actions of a specific user (user ID 12345). It provides a summary of the total count of actions, lists unique actions with their counts, and prints a detailed list of all actions performed by the user.

## Features 
- Prompts the user to enter a User ID. 
- Checks if the User ID exists in the log file. 
- Calculates and displays the total count of actions by the user. 
- Displays the types of actions and their counts. 
- Lists all actions performed by the user.

## Script Breakdown
This section explains the purpose and functionality of each part of the script.

### Prompting for User ID
```bash
# Prompt user to enter User ID
echo "Enter the User ID to analyze his/her actions:"
read user_id
```
- Prompts the user to input a User ID.
- Stores the input in the variable user_id.

### Checking User ID Existence
```bash
# Check if the User ID exists in the log file
if ! grep -q ",$user_id," audit.log; then
    echo "Error: User ID $user_id not found in the log file."
    exit 1
fi
```
- Uses grep to search for the User ID in the audit.log file.
- If the User ID is not found, prints an error message and exits the script.

### Displaying the Summary Header
```bash
# Display the header for the summary
echo "SUMMARY OF ACTIONS OF USER $user_id"
echo "=================================="
```
- Prints a header for the user action summary.

### Calculating Total Action Count
```bash
# Calculate and display the total count of actions by the user
awk -F ',' -v user="$user_id" '$2 == user {count++} END {print "- TOTAL COUNT : "count}' audit.log
```
- Uses awk to calculate and print the total number of actions performed by the user.
- The -v user="$user_id" option passes the User ID to awk.
- The -F ',' option sets the field separator to a comma.

### Displaying Action Types and Counts
```bash
# Display the types of actions and their counts
awk -F ',' -v user="$user_id" '$2 == user {print toupper($4)}' audit.log | sort | uniq -c | awk '{print "- " $2 " : " $1}'
```
- Uses awk to extract the action types ($4), converts them to uppercase, and counts the occurrences of each action type.
- The action types are then sorted and their counts are displayed.

### Listing All User Actions
```bash
# Display all actions by the user
echo "- USER ACTIONS :"
awk -F ',' -v user="$user_id" '$2 == user {print "   "$0}' audit.log
```
- Prints a header for the list of user actions.
- Uses awk to print all actions performed by the user in the original format.

## Example Output

```bash
Enter the User ID to analyze his/her actions: 
12345
SUMMARY OF ACTIONS OF USER 12345 
================================
- TOTAL COUNT : 10
- LOGIN : 5
- LOGOUT : 3
- UPLOAD : 2
- USER ACTIONS : 
    2025-01-01 08:00:00,12345,login,success 
    2025-01-01 08:15:00,12345,logout,success 
    2025-01-01 09:00:00,12345,upload,success 
    2025-01-01 10:00:00,12345,login,success 
    2025-01-01 10:30:00,12345,logout,success 
    ...
```