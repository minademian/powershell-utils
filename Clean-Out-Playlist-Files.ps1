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