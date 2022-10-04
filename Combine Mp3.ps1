$filename = Read-Host "Enter the Filename you'd wish to name your output file. The file extension will be automatically set to .mp3"
#Asks the user for the file name, since a bunch of files might be combined, it may be best to just ask what the ending file name ought to be.

mkdir .\output -force
#creates the output folder, this is needed to drop the end result file in.


Remove-Item .\mylist.txt -force
#removes the mylist.txt file if it already exists.
#This is for cleanliness, otherwise an old file be written over, appended, etc, I think its best to just start fresh.

foreach ($i in Get-ChildItem .\*.mp3) {echo "file '$i'" >> mylist.txt}
#writes the "mylist.txt file"
#this is required by the ffmpeg application.
#FFMPEG concatenate requires the list of files you wish to combine to be in a specific format
#That format is literally - file 'FULL\FILE\PATH\TO\MEDIA\FILE.MP3'
#for example:
#file 'X:\Mux\Lolita\01-01 1a.mp3'
#file 'X:\Mux\Lolita\01-01 1b.mp3'
#file 'X:\Mux\Lolita\01-01 1c.mp3'
#This command was researched and sourced from the FFMPEG documentation at https://trac.ffmpeg.org/wiki/Concatenate#demuxer

$Files = (Get-Content .\mylist.txt)
$Files | Out-File -Encoding "ASCII" .\mylist.txt
#FFMPEG concat requires that the input file be in UTF8 ONLY. Otherwise it won't work.
#This grabs the file, assigns it to a variable, then re-writes it over itself as a utf-8 file.
#note that using flag -encoding utf8 results in the file being written as UTF-8 with BOM. So, apparently, -encoding ASCII is what we want. 

.\ffmpeg -f concat -safe 0 -i .\mylist.txt -c copy ".\Output\$filename.mp3"
#calls the ffmpeg executable from the current directory. issues the concatenate command, feeds it the mylist.txt file.
#then, writes the output using the file name defined by the user in line #1

pause
