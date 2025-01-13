#!/bin/bash
echo "Log Analysis Report"
echo "------------------------"
info_count=$(grep -oiF '[INFO]' DBLog2 | wc -l)
warn_count=$(grep -oiF '[WARN]' DBLog2 | wc -l)
error_count=$(grep -oiF '[ERROR]' DBLog2 | wc -l)
fatal_count=$(grep -oiF '[FATAL]' DBLog2 | wc -l)
debug_count=$(grep -oiF '[DEBUG]' DBLog2 | wc -l)
echo "INFO count: $info_count" | tee log_analysis_report.txt
echo "WARN count: $warn_count" | tee -a log_analysis_report.txt
echo "ERROR count: $error_count" | tee -a log_analysis_report.txt
echo "FATAL count: $fatal_count" | tee -a log_analysis_report.txt
echo "DEBUG count: $debug_count" | tee -a log_analysis_report.txt
echo "Report saved to log_analysis_report.txt"
