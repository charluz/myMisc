
set outDir="Dump"

if not "%1"=="" (
    set outDir=%1
)


adb shell "rm  -f /data/vendor/camera_dump/*"

adb push tsf_dump.sh /tmp
adb shell chmod +x /tmp/tsf_dump.sh


adb shell "cd /tmp && ./tsf_dump.sh"

timeout 1

REM if not exist "%outDir%" (
REM     mkdir %outDir%
REM ) else (
REM     rd /S /Q %outDir%
REM     mkdir %outDir%
REM )
rmdir /S /Q %outDir%
timeout 1
mkdir %outDir%


mkdir %outDir%\ndd
adb pull /data/vendor/camera_dump %outDir%\ndd

mkdir %outDir%\tsf
adb pull /sdcard/camera_dump %outDir%\tsf

mkdir %outDir%\log
adb pull /var/log %outDir%\log



