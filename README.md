# Scheduled Backup Script

## Overview

A Bash-based Linux backup automation project that automatically backs up files that have been modified within the past 24 hours.

## Project Objectives

- Create a Bash backup script.
- Accept a target directory and destination directory as command-line arguments.
- Identify files modified within the last 24 hours.
- Archive and compress the updated files.
- Create timestamped `.tar.gz` backup files.
- Move backup files to the destination directory.
- Schedule the backup script using `cron`.

## Project Structure

| File | Description |
|---|---|
| `backup.sh` | Main Bash backup script |
| `backup-permissions` | Shows executable permissions for `backup.sh` |
| `backup-file-check` | Shows the generated backup file |
| `backup-script-copy` | Shows that `backup.sh` was copied to `/usr/local/bin/` |
| `crontab-schedule` | Shows the daily cron schedule |

## How It Works

```text
Target Directory
       |
       v
Find files modified in last 24 hours
       |
       v
Store files in an array
       |
       v
Create compressed TAR archive
       |
       v
backup-[TIMESTAMP].tar.gz
       |
       v
Destination Directory

