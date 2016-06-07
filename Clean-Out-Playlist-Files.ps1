﻿<#
.SYNOPSIS
Cleans out a directory from music playlist files such as .m3u files.
.DESCRIPTION
Reads through start directory and deletes matched files.
.EXAMPLE
Clean-Out-Playlist-Files.ps1
.LINK
github.com/minademian
#>

$Start = Get-Location
$Counter = 0
$Songs = get-childitem -path $Start -recurs -include *.m3u | ForEach-Object { 
    $FileName = $_.FullName
    $Counter++
    Write-Host "Deleting " $FileName " ..."
    Remove-Item $FileName
    Write-Host "Done deletion."
}
Write-Host "Deleted " $Counter " file(s)."
