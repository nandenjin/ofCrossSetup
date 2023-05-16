Write-Host "Installing for osx..."

$url = "http://ci.openframeworks.cc/projectGenerator/projectGenerator-vs.zip"
$outputPath = "projectGenerator.zip"

Invoke-WebRequest -Uri $url -OutFile $outputPath
Expand-Archive -Path $outputPath -DestinationPath .\ -Force
Move-Item -Path .\projectGenerator-vs\* -Destination .\projectGenerator\ -Force
Remove-Item -Path .\projectGenerator-vs -Recurse -Force
Remove-Item -Path $outputPath -Force

# Exec scripts/vs/download_libs.ps1
& ..\vs\download_libs.ps1
