#!/bin/sh

# Set target IP address for stream
TARGET_IP=$1
if [ "$TARGET_IP" == "" ]
then
    echo "Must specify target IP address"
    exit -1
fi

echo "Sending to $TARGET_IP"

gst-launch-1.0 v4l2src device=/dev/video3 ! \
video/x-raw,format=YUY2,width=2688,height=1944,framerate=30/1 ! \
mtkmdp width=1920 height=1080 ! video/x-raw,format=I420 !  \
tee name=videoraw \
\
videoraw. ! \
queue ! \
videoconvert ! \
video/x-raw,format=I420 ! \
v4l2mtkh264enc bitrate=15000000 gop=1 name=enc ! \
h264parse config-interval=-1 ! \
tee name=videoh264 \
\
videoh264. ! \
rtph264pay ! \
application/x-rtp,media=video, clock-rate=90000, encoding-name=H264, payload=96 ! \
udpsink host=$TARGET_IP port=5000


