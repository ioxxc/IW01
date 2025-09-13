#!/bin/bash
if [ $# -lt 2 ]; then
  echo "Usage: $0 <directory_path> <max_volume_MB> [threshold_percent] [email]"
  exit 1
fi

DIR=$1
MAX_VOLUME_MB=$2
THRESHOLD=${3:-80}   
EMAIL=$4             

if [ ! -d "$DIR" ]; then
  echo "Error: Directory $DIR does not exist."
  exit 1
fi

DIR_SIZE_MB=$(du -sm "$DIR" | cut -f1)

USAGE_PERCENT=$(( DIR_SIZE_MB * 100 / MAX_VOLUME_MB ))

echo "$(date): Directory $DIR usage is ${USAGE_PERCENT}%" >> disk_usage.log

if [ "$USAGE_PERCENT" -ge "$THRESHOLD" ]; then
  if [ -n "$EMAIL" ]; then
    echo "Warning: Disk usage for directory $DIR has exceeded threshold ($THRESHOLD%). Current usage: ${USAGE_PERCENT}%." | mail -s "Disk Usage Alert for $DIR" "$EMAIL"
  else
    echo "Warning: Disk usage for directory $DIR has exceeded threshold ($THRESHOLD%). Current usage: ${USAGE_PERCENT}%."
  fi
fi
