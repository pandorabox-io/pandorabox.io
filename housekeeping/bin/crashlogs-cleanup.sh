#!/bin/sh
set -e
cd /data/crashlogs
find . -mtime +14 -name "*.txt" -print -delete
