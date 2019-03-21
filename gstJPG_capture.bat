@echo off

REM --------------------------------------------
REM Initialize default variables
REM --------------------------------------------

REM  dxName : to create a sub-folder in /tmp to collect JPG files.
set dxName=gstJPG
set sizeW=1920
set sizeH=1080

if "%1"=="--help" (
	@echo.
	@echo Usage: gstJPG_capture.bat [dxName] [-full]
	@echo.
	@echo Descriptions
	@echo   To capture and dump YUV images from Theia camera.
	@echo.
	@echo   dxName : name of the sub-folder 
	@echo      For the sake of pull all captured JPG files, a sub-folder will be created in camera under /tmp directory.
	@echo      If the sub-folder name is not specified, it will use "gstJPG" as default name of the sub-folder.
	@echo.
	@echo   -full : to capture full size "(2688x1944)" image.
	@echo      optional, size of 1920x1080 will be set by default.
	@echo.
	goto :_exit
)



:loop_args
if not "%1"=="" (
	if "%1"=="-full" (
		set sizeW=2688
		set sizeH=1944
		goto :next_arg
	)

	set dxName=%1

:next_arg
	shift
	goto :loop_args
)


rem DEBUG ONLY
goto :roll_up_sleeves
echo dxName = %dxName%
echo sizeW = %sizeW%
echo sizeH = %sizeH%
goto :_exit


REM ----------------------------------------
REM Main Section
REM ----------------------------------------
:roll_up_sleeves
set camDir=/tmp/%dxName%

@echo.
@echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@echo "Capturing %sizeW%x%sizeH% JPEG image to %camDir%/ ..."
@echo Press Ctrl-C to stop JPG capture.
@echo Issue command : "adb pull %camDir%" to download JPGs from camera.
@echo ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
@echo.

rem adb shell setprop debug.mapping_mgr.enable 3

rem adb shell setprop vendor.debug.ae_mgr.enable 1
rem adb shell setprop vendor.debug.ae_mgr.preview.update 1
rem rem adb shell setprop vendor.debug.ae_mgr.shutter 33000 
rem adb shell setprop vendor.debug.ae_mgr.shutter 16500 
rem adb shell setprop vendor.debug.ae_mgr.sensorgain 1024
rem adb shell setprop vendor.debug.ae_mgr.ispgain 1024
rem adb shell setprop vendor.debug.camera.dump.JpegNode 1
rem adb shell setprop vendor.debug.capture.forceZsd 1

adb shell mkdir -p %camDir%
adb shell rm -f %camDir%/*
adb shell gst-launch-1.0 -v v4l2src device="/dev/video3" ! video/x-raw,format=\(string\)YUY2,width=%sizeW%,height=%sizeH% ! jpegenc ! multifilesink location="%camDir%/test1%%03d.jpeg"


:_exit
