#!/bin/bash

TELEGRAM_TOKEN="8430563367:AAHKfaZ_-N1-_EZZLpOI3-_zU2HUKuyRjRc"    
CHAT_ID="1678610282"                         
THRESHOLD=80                                

if [ $# -lt 2 ]; then
  echo "Usage: $0 <directory_path> <max_volume_MB> [threshold_percent]"
  exit 1
fi

DIR=$1
MAX_VOLUME_MB=$2
THRESHOLD=${3:-$THRESHOLD}

if [ ! -d "$DIR" ]; then
  echo "Error: Directory $DIR does not exist."
  exit 1
fi

DIR_SIZE_MB=$(du -sm "$DIR" | cut -f1)
USAGE_PERCENT=$(( DIR_SIZE_MB * 100 / MAX_VOLUME_MB ))

# --- Log ---
echo "$(date): Directory $DIR usage is ${USAGE_PERCENT}%" >> disk_usage.log

# --- Alert if Needed ---
if [ "$USAGE_PERCENT" -ge "$THRESHOLD" ]; then
  ALERT_MSG="🚨 *Disk Usage Alert*
Directory: \`$DIR\`
Usage: *${USAGE_PERCENT}%*
Threshold: ${THRESHOLD}%"

  curl -s -X POST "https://api.telegram.org/bot${TELEGRAM_TOKEN}/sendMessage" \
    -d chat_id="${CHAT_ID}" \
    -d text="$ALERT_MSG" \
    -d parse_mode="Markdown"
fi
