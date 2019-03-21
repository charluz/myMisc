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




