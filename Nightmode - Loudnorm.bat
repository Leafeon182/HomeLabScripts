if not exist "ffmpegOut\" MD "ffmpegOut"

for %%A IN ("*.mkv") Do ffmpeg -y -i "%%A" -map 0:v -c:v copy -map 0:a:0? -c:a:0 copy -map 0:a:0? -c:a:1 aac -ac 2 -filter:a:1 "loudnorm" -ar:a:1 48000 -b:a:1 192k -metadata:s:a:1 title="Eng 2.0 Stereo" -metadata:s:a:1 language=eng -map 0:a:1? -c:a:2 copy -map 0:a:2? -c:a:3 copy -map 0:a:3? -c:a:4 copy -map 0:a:4? -c:a:5 copy -map 0:a:5? -c:a:6 copy -map 0:a:6? -c:a:7 copy -map 0:s? -c:s copy "ffmpegOut/%%~nA.mkv"

pause