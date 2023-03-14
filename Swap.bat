
if not exist "ffmpegOut\" MD "ffmpegOut"


for %%A IN ("*.mkv") Do ffmpeg -y -i "%%A" -map 0:v:0 -map 0:a:1 -map 0:a:0 -c copy -map 0:a:2? -c:a copy -map 0:a:3? -c:a copy -map 0:s? -c:s copy "ffmpegOut/%%~nA.mkv"

pause