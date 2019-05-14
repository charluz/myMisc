echo "Starting cct_camera_server ..."

adb push tsf_dump_init.sh /tmp
adb shell chmod +x /tmp/tsf_dump_init.sh

adb shell "cd /tmp && ./tsf_dump_init.sh"

timeout 1
