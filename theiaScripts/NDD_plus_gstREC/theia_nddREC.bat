@echo off

REM -----------------------------------------------------------------
REM - The main batch script to capture NDD dump and gst video.
REM ------------------------------------------------------------------
REM - Usages:
REM -   cmd> theia_nddREC.bat  projDIR
REM -
REM - This program will create (if not exists) a directory, projDIR, and
REM - capture an NDD dump and a video clip in projDIR diectory.
REM -------------------------------------------------------------------

set projDIR=%1
set recFile=%2

echo "projDir= %projDIR% ..."

if not exist %projDIR%\ (
    REM echo "Driectory %projDIR% not exists, creating ..."
    mkdir %projDIR%
)

REM ----- NDD Dump ---------------------------------
call nddREC_ndd.bat %projDIR%
cd %projDIR%
for /R %%f in (*.jpg) do (
    @copy /Y %%f ..\%projDIR%.jpg
)
cd ..

goto :skip

REM ----- Record gstream video ---------------------
start gstREC_record.bat -ae
timeout 30
pause

REM ----- Pull back video clip ---------------------
adb pull /tmp/gstREC
move /Y theia.avi %projDIR%.avi

:skip
