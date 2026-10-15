#!/bin/bash
# disk_alert.sh - Warn if any filesystem is over 80% full
# Author: jabakaa

THRESHOLD=80
ALERT=0

while read -r line; do
    usage=$(echo "$line" | awk '{print $5}' | tr -d '%')
    mount=$(echo "$line" | awk '{print $6}')
    if [ "$usage" -ge "$THRESHOLD" ]; then
        echo "WARNING: $mount is ${usage}% full"
        ALERT=1
    fi
done < <(df -h --output=source,size,used,avail,pcent,target | tail -n +2)

[ "$ALERT" -eq 0 ] && echo "All filesystems OK (below ${THRESHOLD}%)"

