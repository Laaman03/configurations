#!/usr/bin/env bash

tar --exclude=node_modules czf /tmp/home-dir.tar.gz -C /home/wfarris .
rclone copy /tmp/home-dir.tar.gz gcs:$(date +"%Y-%m-%d")-apc-ubuntu.tar.gz
rm /tmp/home-dir.tar.gz
