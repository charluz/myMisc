#!/bin/sh

mount -o remount,rw  /
mkdir -p /sdcard/camera_dump/
cct_camera_server &
sleep 1


