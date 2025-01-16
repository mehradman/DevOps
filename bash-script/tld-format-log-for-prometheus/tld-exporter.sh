#!/bin/bash

./audit-analysis.sh > input.txt

# File paths
INPUT_FILE="input.txt"
OUTPUT_FILE="metrics.prom"

# Read the input file line by line
total_count=0
failed_count=0
success_count=0
actions=""
user_id=""

while IFS= read -r line
do
  if [[ $line == *"TOTAL COUNT :"* ]]; then
    total_count=$(echo $line | awk -F': ' '{print $2}')
  elif [[ $line == *"FAILED :"* ]]; then
    failed_count=$(echo $line | awk -F': ' '{print $2}')
  elif [[ $line == *"SUCCESS :"* ]]; then
    success_count=$(echo $line | awk -F': ' '{print $2}')
  elif [[ $line == *","* ]]; then
    timestamp=$(echo $line | awk -F',' '{print $1}')
    user_id=$(echo $line | awk -F',' '{print $2}')
    action=$(echo $line | awk -F',' '{print $3}')
    status=$(echo $line | awk -F',' '{print $4}')
    actions="${actions}user_${user_id}_action{timestamp=\"${timestamp}\",user_id=\"${user_id}\",action=\"${action}\",status=\"${status}\"} 1\n"
  fi
done < "$INPUT_FILE"

# Write to the output file
{
  echo "# TYPE user_actions_total counter"
  echo -e "$actions"
  echo "# TYPE user_actions_summary gauge"
  echo "user_actions_summary{user="${user_id}",status="total"} $total_count"
  echo "user_actions_summary{user="${user_id}",status="failed"} $failed_count"
  echo "user_actions_summary{user="${user_id}",status="success"} $success_count"
} > "$OUTPUT_FILE"

echo "Metrics written to $OUTPUT_FILE"
