# Go https://ffmpeg.org/download.html to download ffmpeg
Write-Output '======================================= Convert MP4 to MP3 ======================================='
mkdir "mp3"
$files = Get-ChildItem . *.mp4
$files | ForEach-Object {
    $fileWithoutExtension =  $_.BaseName;
    $mp4FileName = $_.NameString;
    $mp3FileName = $fileWithoutExtension+'.mp3';
    $outDir = "./mp3";
    $outFileLocation = $outDir + "/" + $mp3FileName; 
    ffmpeg.exe -i $mp4FileName -vn -ar 44100 -ac 2 -b:a 192k $outFileLocation;
}