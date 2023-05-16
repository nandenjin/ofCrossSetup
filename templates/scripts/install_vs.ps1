Write-Host "Installing for Visual Studio..."

$url = "http://ci.openframeworks.cc/projectGenerator/projectGenerator-vs.zip"
$outputPath = "projectGenerator.zip"

Invoke-WebRequest -Uri $url -OutFile $outputPath
Expand-Archive -Path $outputPath -DestinationPath .\projectGenerator -Force
Remove-Item -Path $outputPath -Force

# Exec scripts/vs/download_libs.ps1
$scriptPath = Join-Path -Path $PSScriptRoot -ChildPath "..\vs\download_libs.ps1"
& $scriptPath
