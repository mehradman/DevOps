#!/bin/bash

echo "SUMMARY OF ACTIONS OF USER 12345"
echo -e "================================"

awk -F ',' '$2 == "12345" {count++} END {print "- TOTAL COUNT : "count}' audit.log
awk -F ',' '$2 == "12345" {print toupper($4)}' audit.log | sort | uniq -c | awk '{print "- " $2 " : " $1}'

echo "- USER ACTIONS :"
awk -F ',' '$2 == "12345" {print "   "$0}' audit.log
