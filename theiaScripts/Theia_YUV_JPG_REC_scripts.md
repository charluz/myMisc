<!-- =============================== -->
# cam_CaptureTool.bat #
<!-- =============================== -->
使用 MTK Capture Tool 指令拍照的批次指令稿。

單獨使用(不帶參數)，預設會拍 1 張 2688x1944 JPG 存在 camera /data/vendor/camera_dump 目錄，並且從 camera 抓回存到當下目錄。
預設的照片曝光是 33.333ms，Sensor / ISP Gain 都是 x1。

如果要指定曝光時間，指令如下:
cmd> cmd_CaptureTool.bat -exp N
( N 是曝光時間，單位 us)

如果要指定 Sensor Gain，指令如下:
cmd> cmd_CaptureTool.bat -sgain N
( N 是 Gain，單位 1024 = x1 gain)

如果要指定 ISP Gain，指令如下:
cmd> cmd_CaptureTool.bat -igain N
( N 是 Gain，單位 1024 = x1 gain)

如果要指定拍照張數，指令如下:
cmd> cmd_CaptureTool.bat -num N
( N 是張數 )

如果要指定照片抓回來存放位置，指令如下:
cmd> cmd_CaptureTool.bat localDir
( localDir 是目錄路徑、名稱 )


cam_CaptureTool.bat 拍照後預設不會清除 Camera 以及 local (PC)
下的照片。如果持續拍照，一者是 Camera 端空間可不足，再者拍照後抓檔
時間也會跟這變長。以下指令可以在拍照前清除 Camera /data/vendor/camera_dump 以及本地端目錄裡面的舊照片，如此便可確保每次抓回的都是當次指令拍的照片。

cmd> cmd_CaptureTool.bat -clear



<!-- =============================== -->
# captureYUV_v4l2.bat #
<!-- =============================== -->

Theia V4L2 capture YUV 指令。
單獨使用(不帶參數)，預設會拍 2 張 1920x1080 YUV 存在 camera /tmp/theia.yuv。
拍完 YUV 後，自動 adb pull 回來，檔名就是 theia.yuv 。

如果要設定 capture 張數，指令如下:
cmd> captureYUV_v4l2.bat -n N

(N 值範圍 1 ~ 200)


如果要 capture Full Size (2688x1944)，指令如下:
cmd> captureYUV_v4l2.bat -full

如果要指定 YUV file name，指令如下:
cmd> captureYUV_v4l2.bat test_abc

存出的檔名就是 test_abc.yuv 。


<!-- =============================== -->
# gstJPG_capture.bat #
<!-- =============================== -->

Theia GStreamer capture JPG 指令。
GStreamer capture 開始後就會一直拍 JPG，必須 User 自己決定要拍多久。
要結束 Capture，console 直接下 Ctrl-C 結束。

單獨使用(不帶參數)，預設 size 是 1920x1080，所有 JPG file 存在 camera /tmp/gstJPG 目錄下。
所以要抓回 JPG files，只要 下 "adb pull /tmp/gstJPG ." 指令即可。

如果要 capture Full Size (2688x1944)，指令如下:
cmd> gstJPG_capture.bat -full


<!-- =============================== -->
# gstAVI_record.bat #
<!-- =============================== -->

Theia GStreamer video record 指令。
GStreamer Record 開始後就會一直錄影，必須 User 自己決定要拍多久。
要結束 Record，直接下 Ctrl-C 結束。

單獨使用(不帶參數)，預設 Video 檔名為 theia.avi，存在 camera /tmp/gstREC 目錄下。
所以要抓回 Video files，只要 下 "adb pull /tmp/gstREC ." 指令即可。

如果要指定 Video file name，指令如下:
cmd> gstAVI_record.bat testABC

存出的檔名就是 testABC.avi 。




