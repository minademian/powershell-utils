<#
.SYNOPSIS
Makes good, honest .eml files out of .emlx files.
.DESCRIPTION
Traverses a directory with your Apple Mail emails (in .emlx format) and converts them all into Outlook-friendly .eml files.
.PARAMETER StartPath
full path of directory (C:\foo\zeball\to\)
.EXAMPLE
Convert-Emlx-To-Outlook -StartPath C:\foo\zeball\to
.LINK
github.com/minademian
#>

param(
[Parameter(Mandatory=$true)][string]$StartPath
)

$Start = $StartPath
$Counter = 0

get-childitem -path $Start -recurs -include *.emlx | ForEach-Object { 
    $FullPathToFile = $_.FullName # full path to file, including extension
    $FileName = $_.BaseName # name of file without extension
    $FullFileName = $_.Name # name of file with extension, without full path
    $Path = $_.DirectoryName
    $NewFileName = $Path + "\" + $FileName + ".eml"
    Write-Host "Renaming extension for" $FullPathToFile ", new name is" $NewFileName "`n"
    Rename-Item $FullPathToFile $NewFileName
    if ($?) {
        Write-Host "Done renaming.`n"
    }
    $Counter++
}
Write-Host "Renamed " $Counter " file(s)."
