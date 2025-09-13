#!/bin/bash

DIR="$1"
shift
EXTENSIONS=("$@")

if [ ${#EXTENSIONS[@]} -eq 0 ]; then
  EXTENSIONS=(".tmp")
fi

if [ ! -d "$DIR" ]; then
  echo "Error: Directory '$DIR' does not exist."
  exit 1
fi

DELETED_COUNT=0
for EXT in "${EXTENSIONS[@]}"; do
  FILES=$(find "$DIR" -type f -name "*$EXT")
  for FILE in $FILES; do
    rm "$FILE"
    ((DELETED_COUNT++))
  done
done

echo "Deleted $DELETED_COUNT file(s)."

