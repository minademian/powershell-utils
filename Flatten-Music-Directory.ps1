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