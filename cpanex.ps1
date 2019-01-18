# This script copies source files from an Android project to an exercise folder.
# Files from a directory called src in the current directory is copied to a 
# specified directory a step back in the directory tree. The specified directory
# will be created if it does not exist.

param (
    # Destination folder, if arguments not present, default value is prompting input
    [string]$exerciseFolder = (Read-Host -Prompt 'Input destination folder name'),
    # Option for forcing file copying. Files will be overwritten if this switch is
    # used, otherwise not.
    [switch]$F = $false
)

$exercisePath = -join((Get-Item -Path "..\").FullName,"\",$exerciseFolder,"\src\")
$srcPath = (Get-Item -Path ".\src\main").FullName

New-Item -ErrorAction Ignore -ItemType Directory -Path $exercisePath

if ($F) {
    Copy-Item $srcPath $exercisePath -Recurse -Verbose -Force
} else {
    Copy-Item $srcPath $exercisePath -Recurse -Verbose 
}