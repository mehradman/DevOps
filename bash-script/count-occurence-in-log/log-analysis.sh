#!/bin/bash

echo "Log Analysis Report"
echo "------------------------"

log_file="sample.log"

info_count=$(grep -oiF '[INFO]' "$log_file" | wc -l)
warn_count=$(grep -oiF '[WARN]' "$log_file" | wc -l)
error_count=$(grep -oiF '[ERROR]' "$log_file" | wc -l)
fatal_count=$(grep -oiF '[FATAL]' "$log_file" | wc -l)
debug_count=$(grep -oiF '[DEBUG]' "$log_file" | wc -l)

report_file="log_analysis_report.txt"

{
    echo "INFO count: $info_count"
    echo "WARN count: $warn_count"
    echo "ERROR count: $error_count"
    echo "FATAL count: $fatal_count"
    echo "DEBUG count: $debug_count"
    echo "Report saved to $report_file"
} | tee "$report_file"
