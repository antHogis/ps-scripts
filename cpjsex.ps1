# This script is intended for copying essential files of a node.js project
# to a specified folder one step back in the directory tree. Does not copy
# recursively, so the node_modules directory is ignored. Designed for
# automating copying of JS exercises, without the need to initialize a new
# npm repo for every exercise.

param (
    # Uses parameter as destination folder, if arguments not present, default
    # value is prompting input
    [string]$folder = (Read-Host -Prompt 'Input destination folder name')
)

$exercisePath = -join((Get-Item -Path "..\").FullName,"\",$folder,"\")
$currentDir = (Get-Item -Path ".\").FullName

$fileNames = @("*.js","package.json","package-lock.json", "*.html", "*.css")

New-Item -ErrorAction Ignore -ItemType Directory -Path $exercisePath

for ($i=0; $i -lt $fileNames.length; $i++) {
    $filePath = -join($currentDir,"\",$fileNames[$i])
    $fileDestination = -join($exercisePath,$fileNames[$i])

    if (Test-Path($filePath)) {
        $writeFile = $true
        
        if (Test-Path($fileDestination)) {
            $message = "File $($fileDestination) already exists. Overwrite? [y/n] (Default: yes): "
            Write-Host $message -NoNewline -ForegroundColor Yellow -BackgroundColor Black
            $response = Read-Host
            $writeFile = ($response -ne "n") -and ($response -ne "N")
        }

        if ($writeFile) {
            Copy-Item -Path $filePath -Destination $exercisePath
            Write-Host "Wrote:" $fileDestination -ForegroundColor Green -BackgroundColor Black
        }
    } else {
        Write-Host "Did not find:" $filePath -ForegroundColor Red -BackgroundColor Black
    }
}