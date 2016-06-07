<#
.SYNOPSIS
Moves all music files in a directory with may sub-directories (ie: iTunes) into root directory.
.DESCRIPTION
Starting from root directory you select, script moves all music files from sub-directories into root directory.
.EXAMPLE
Flatten-Music-Directory.ps1
.LINK
github.com/minademian
#>

$Start = Get-Location
$Songs = get-childitem -path $Start -recurs -include *.mp3 | ForEach-Object { 
    $FileName = $_.FullName
    $path = split-path $FileName
    if ($path -ne $Start) {
        Write-Host "Moving " $FileName "to " $Start
        Move-Item -path $FileName -Destination $Start
        Write-Host "Done moving."
    }
}
