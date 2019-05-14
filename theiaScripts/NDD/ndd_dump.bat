@echo off

set outDir="Dump"

if not "%1"=="" (
    set outDir=%1
)

adb push ndd_dump.sh /tmp
adb shell chmod +x /tmp/ndd_dump.sh

REM -- Start NDD
echo '##### Starting NDD ...'
adb shell "cd /tmp && ./ndd_dump.sh"

REM timeout 1

REM -- Pull back NDD data
echo ""##### Pulling back NDD data into %outDir%\ndd ..."
rmdir /S /Q %outDir%
REM timeout 1
mkdir %outDir%

mkdir %outDir%\ndd
adb pull /data/vendor/camera_dump %outDir%\ndd

REM goto :_skip
REM mkdir %outDir%\tsf
REM adb pull /sdcard/camera_dump %outDir%\tsf
REM
REM mkdir %outDir%\log
REM adb pull /var/log %outDir%\log
REM
REM :_skip
REM echo ''Bye, Bye'



