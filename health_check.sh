#!/bin/bash
# health_check.sh - Simple system health report
# Author: okaykairoo
# Usage: ./health_check.sh

echo "===== System Health Report ====="
echo "Date      : $(date)"
echo "Hostname  : $(hostname)"
echo "Uptime    : $(uptime -p)"
echo "--------------------------------"
echo "CPU Load  : $(cat /proc/loadavg | awk '{print $1, $2, $3}')"
echo "Memory    : $(free -h | awk '/Mem:/ {print $3 " used of " $2}')"
echo "Disk (/): $(df -h / | awk 'NR==2 {print $3 " used of " $2 " (" $5 ")"}')"
echo "--------------------------------"
echo "Logged-in users:"
who
echo "================================"
