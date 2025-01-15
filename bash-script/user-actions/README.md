# User Action Summary Script

## Overview
This script processes a log file (`audit.log`) to summarize and detail the actions of a specific user (user ID 12345). It provides a summary of the total count of actions, lists unique actions with their counts, and prints a detailed list of all actions performed by the user.

## Script Breakdown
1. **Prints a header**:
    ```bash
    echo "SUMMARY OF ACTIONS OF USER 12345"
    echo "================================"
    ```

2. **Counts the total number of actions by user 12345** and prints it:
    ```bash
    awk -F ',' '$2 == "12345" {count++} END {print "- TOTAL COUNT : "count}' audit.log
    ```

3. **Lists the unique actions performed by the user along with their counts**:
    ```bash
    awk -F ',' '$2 == "12345" {print toupper($4)}' audit.log | sort | uniq -c | awk '{print "- " $2 " : " $1}'
    ```

4. **Prints a detailed list of all actions performed by the user**:
    ```bash
    echo "- USER ACTIONS :"
    awk -F ',' '$2 == "12345" {print "   "$0}' audit.log
    ```

## Example Output

```bash
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