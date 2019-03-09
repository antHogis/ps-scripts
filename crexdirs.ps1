param (
    [Int]$exer_nmbr = ([Int] (Read-Host -Prompt 'Input exercise number')),
    [Int]$exer_amnt = ([Int] (Read-Host -Prompt 'Input the amount of exercise assignments'))
)
# $exer_nmbr = Read-Host -Prompt 'Input exercise number'
# $exer_nmbr = [int] $exer_nmbr

# $exer_amnt = Read-Host -Prompt 'Input the amount of exercise assignments'
# $exer_amnt = [int] $exer_amnt

$exer_path
if ($exer_nmbr -lt 10) {
  $exer_path = -join(".\","exercises0",$exer_nmbr)
} else {
  $exer_path = -join(".\","exercises",$exer_nmbr)
}
New-Item -ErrorAction Ignore -ItemType directory -Path $exer_path

for([int]$i=1; $i -le $exer_amnt; $i++) {
  if ($i -lt 10) {
    New-Item -ErrorAction Ignore -ItemType directory -Path (-join($exer_path,"\e0",$i))
  } else {
    New-Item -ErrorAction Ignore -ItemType directory -Path (-join($exer_path,"\e",$i))
  }
}
