@echo off

rem Initialize default variables
set svName=theia
set sizeW=1920
set sizeH=1080
set /A numPic=2

if "%1"=="--help" (
	@echo.
	@echo Usage: captureYUV_v4l2.bat [yuvFileName] [-full] [-n N]
	@echo.
	@echo Descriptions
	@echo   To capture and dump YUV images from Theia camera.
	@echo.
	@echo   yuvFileName : the name of output YUV file.
	@echo      optional, if not specifed, the output YUV image is named as test.yuv by default.
	@echo.
	@echo   -full : to capture full size "(2688x1944)" YUV image.
	@echo      optional, size of 1920x1080 will be set by default.
	@echo.
	@echo   -n N : specify the number "(N)" of images to be encapsulated in the output file.
	@echo      optional, 2 images are saved by default.
	@echo.
	goto :_exit
)


:loop_args
if not "%1"=="" (
	if "%1"=="-n" (
		set /A numPic=%2
		shift
		if %numPic% lss 1 ( set /A numPic=1 )
		if %numPic% gtr 200 ( set /A numPic=200 )
		goto :next_arg
	)
	
	if "%1"=="-full" (
		set sizeW=2688
		set sizeH=1944
		goto :next_arg
	)

	set svName=%1

:next_arg
	shift
	goto :loop_args
)


rem DEBUG ONLY
goto :roll_up_sleeves
echo svName = %svName%
echo numPic = %numPic%
echo sizeW = %sizeW%
echo sizeH = %sizeH%
goto :_exit


:roll_up_sleeves
rem set camDir=/data/vendor/camera_dump
rem set camDir=/tmp

@echo "Capturing %numPic% %sizeW%x%sizeH% YUV into %camDir%/%svName%.yuv..."
rem adb shell setprop debug.mapping_mgr.enable 3

rem adb shell setprop vendor.debug.ae_mgr.enable 1
rem adb shell setprop vendor.debug.ae_mgr.preview.update 1
rem rem adb shell setprop vendor.debug.ae_mgr.shutter 33000 
rem adb shell setprop vendor.debug.ae_mgr.shutter 16500 
rem adb shell setprop vendor.debug.ae_mgr.sensorgain 1024
rem adb shell setprop vendor.debug.ae_mgr.ispgain 1024
rem adb shell setprop vendor.debug.camera.dump.JpegNode 1
rem adb shell setprop vendor.debug.capture.forceZsd 1

adb shell v4l2_camera -d /dev/video3 -c %numPic% -n 6 -f %sizeW%*%sizeH% -p 2 -r /tmp/%svName%.yuv

@echo "Pulling /tmp/%svName%.yuv back , size %sizeW%x%sizeH%, numPic= %numPic% ..."
rem del /F /Q .\%svName%.yuv
adb pull /tmp/%svName%.yuv

@echo "Capture YUV ~~ Done !"

:_exit
