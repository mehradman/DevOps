# Log Analysis Script

This script generates a report based on log entries from a specified log file. It counts the occurrences of different log levels (INFO, WARN, ERROR, FATAL, DEBUG) and saves the report to a text file named log_analysis_report.

## Explanation

- log_file: The log file to analyze (default is sample.log).

- report_file: The file where the report is saved (log_analysis_report.txt).

- grep: Command used to search for log levels in the log file.

- wc -l: Counts the number of lines (occurrences of each log level).

- tee: Displays the output on the screen and writes it to the report file.
