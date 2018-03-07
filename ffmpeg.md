## ffmpeg



1. 转码 控制码率为2500k

   ```bash
   ffmpeg -i input.mp4 -vcodec h264 -b:v 2500k -bufsize 2500k 1.mp4
   ```

2. 合并视频

   ```bash
   ffmpeg -i concat:"input1.mp4|input2.mp4" -c copy output.mp4
   ```

3. 提取字幕

   ```bash
   ffmpeg -i input.mp4 -map 0:s:0 subtitle.srt
   ```



4. 添加字幕

   ```bash
   ffmpeg -i input.mp4 -vf subtitles=title.srt output.mp4
   ```

5. 马赛克

   - 腾讯视频
     - **1920*1080** :  `ffmpeg -i 2.mp4 -vf delogo=1520:45:350:110 out.mp4`
     - **1280*720** :  `ffmpeg -i 2.mp4 -vf delogo=880:45:350:110 out.mp4`
   - CCTV
     - **960*540**
       - `ffmpeg -i 09.mp4 -vf delogo=55:35:150:40 09-1.mp4`
       - `ffmpeg -i 10.m4v -vf delogo=55:35:150:40 -vcodec h264 -b:v 1700k -bufsize 1700k 10.mp4`
         ​	
6. 下载

   ```bash
   ffmpeg -i url -c:v copy -c:a copy -bsf:a aac_adtstoasc output.mp4
   ```

   ```
   ffmpeg -i http://183.252.176.40/PLTV/88888888/224/3221225930/index.m3u8 -c:v copy -c:a copy -bsf:a aac_adtstoasc output.mp4
   ```


7. 修改分辨率

   ```bash
   ffmpeg -i input_file -s 320x240 output_file
   ```


8. 添加logo
  - 左上角:`ffmpeg -i input.mp4 -i logo.png -filter_complex overlay output.mp4`
  - 右上角:`ffmpeg -i input.mp4 -i logo.png -filter_complex overlay=W-w output.mp4 `
  - 左下角: `ffmpeg -i input.mp4 -i logo.png -filter_complex overlay=0:H-h output.mp4`
  - 右下角: `ffmpeg -i input.mp4 -i logo.png -filter_complex overlay=W-w:H-h output.mp4`