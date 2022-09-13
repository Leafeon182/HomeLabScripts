if not exist "ffmpegOut\" MD "ffmpegOut"

for %%A IN ("*.m4b") Do ffmpeg -y -i "%%A" -filter:a "atempo=1.4000689" -vn "ffmpegOut/%%~nA.m4b

for %%A IN ("*.mp3") Do ffmpeg -y -i "%%A" -filter:a "atempo=1.4000689" -vn "ffmpegOut/%%~nA.mp3
pause

for %%A IN ("*.m4a") Do ffmpeg -y -i "%%A" -filter:a "atempo=1.4000689" -vn "ffmpegOut/%%~nA.m4a
pause