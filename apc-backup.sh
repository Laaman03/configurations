#!/usr/bin/env bash

rm /tmp/home-dir.tar.gz
tar czf /tmp/home-dir.tar.gz --exclude="node_modules" --exclude="containers/storage/vfs" --exclude=".cache" -C /home/wfarris . 
rclone copy /tmp/home-dir.tar.gz gcs:laaman-apc-backup/$(date +"%Y-%m-%d")-apc-ubuntu
rm /tmp/home-dir.tar.gz
