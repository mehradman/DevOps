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
  echo "# TYPE user_${user_id}_total_count counter"
  echo "user_${user_id}_total_count $total_count"
  echo ""
  echo "# TYPE user_${user_id}_failed_count counter"
  echo "user_${user_id}_failed_count $failed_count"
  echo ""
  echo "# TYPE user_${user_id}_success_count counter"
  echo "user_${user_id}_success_count $success_count"
  echo ""
  echo "# TYPE user_${user_id}_action counter"
  echo -e "$actions"
} > "$OUTPUT_FILE"

echo "Metrics written to $OUTPUT_FILE"
