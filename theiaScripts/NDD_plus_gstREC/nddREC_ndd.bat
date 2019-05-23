@echo off

set outDir="NDD"
set ndd_shell_cmd=nddREC_ndd.sh

if not "%1"=="" (
    set outDir=%1
)

adb push %ndd_shell_cmd% /tmp
adb shell chmod +x /tmp/%ndd_shell_cmd%

REM -- Start NDD
echo '##### Starting NDD ...'
adb shell "cd /tmp && ./%ndd_shell_cmd%"

REM -- Pull back NDD data
echo "##### Pulling back NDD data into %outDir% ..."
rmdir /S /Q %outDir%
REM timeout 1
mkdir %outDir%

adb pull /data/vendor/camera_dump %outDir%

REM goto :_skip
REM mkdir %outDir%\tsf
REM adb pull /sdcard/camera_dump %outDir%\tsf
REM
REM mkdir %outDir%\log
REM adb pull /var/log %outDir%\log
REM
REM :_skip
REM echo ''Bye, Bye'
