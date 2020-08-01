#!/usr/bin/env bash

rm /tmp/home-wsl-backup.tar.gz
tar czf /tmp/home-wsl-backup.tar.gz --exclude="node_modules" --exclude="containers/storage/vfs" --exclude=".cache" -C /home/wfarris . 
rclone copy /tmp/home-wsl-backup.tar.gz gcs:laaman-home-backup/$(date +"%Y-%m-%d")
rm /tmp/home-wsl-backup.tar.gz
