
if not exist "ffmpegOut\" MD "ffmpegOut"

for %%A IN ("*.mkv") Do ffmpeg -y -i "%%A" -map 0:v -c:v copy -map 0:a:0? -c:a:0 copy -map 0:a:0? -c:a:1 aac -b:a:1 192k -ac 2 -filter:a:1 "pan=stereo|FL=FC+0.30*FL+0.30*FLC+0.30*BL+0.30*SL+0.60*LFE|FR=FC+0.30*FR+0.30*FRC+0.30*BR+0.30*SR+0.60*LFE" -metadata:s:a:1 title="Eng NightMode" -metadata:s:a:1 language=eng -map 0:a:1? -c:a:2 copy -map 0:a:2? -c:a:3 copy -map 0:a:3? -c:a:4 copy -map 0:a:4? -c:a:5 copy -map 0:a:5? -c:a:6 copy -map 0:a:6? -c:a:7 copy -map 0:s? -c:s copy "ffmpegOut/%%~nA.mkv"

pause