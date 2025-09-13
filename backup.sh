#!/bin/bash

SOURCE_DIR="$1"
BACKUP_DIR="$2"
DATE=$(date +%Y-%m-%d)
ARCHIVE_NAME="backup-$DATE.tar.gz"

if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_DIR"] ; then
    echo "Usage : $0 <source_directory> <backup_direectory>"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
  echo "Error: Nu exista '$SOURCE_DIR' directory."
  exit 1
fi

if [ ! -d "$BACKUP_DIR" ]; then
  echo "Error: Backup directory '$BACKUP_DIR' does not exist."
  exit 1
fi

tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$(dirname "$SOURCE_DIR")" "$(basename "$SOURCE_DIR")"

if [ $? -eq 0 ]; then
  echo "Backup successful: $BACKUP_DIR/$ARCHIVE_NAME"
else
  echo "Error: Backup failed."
  exit 1
fi
