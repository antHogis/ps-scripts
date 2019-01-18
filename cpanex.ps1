param (
    #Uses parameter as destination folder, if arguments not present, default value is prompting input
    [string]$exerciseFolder = (Read-Host -Prompt 'Input destination folder name'),
    [switch]$F = $false
)

$exercisePath = -join((Get-Item -Path "..\").FullName,"\",$exerciseFolder,"\src\")
$srcPath = (Get-Item -Path ".\src\main").FullName

#tubular dude

New-Item -ErrorAction Ignore -ItemType Directory -Path $exercisePath

if ($F) {
    Copy-Item $srcPath $exercisePath -Recurse -Verbose -Force
} else {
    Copy-Item $srcPath $exercisePath -Recurse -Verbose 
}