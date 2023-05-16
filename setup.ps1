$OF_VERSION = $env:OF_VERSION
if ([string]::IsNullOrWhiteSpace($OF_VERSION)) {
    $OF_VERSION = "0.11.2"
}

Write-Host "`n🙋‍♂️ Installing openFrameworks v$OF_VERSION`n"

$PROJECT_NAME = $env:PROJECT_NAME
if ([string]::IsNullOrWhiteSpace($PROJECT_NAME)) {
    $PROJECT_NAME = Split-Path -Leaf $PWD.Path
}

Write-Host "`nProject name = $PROJECT_NAME`n"

# Download and extract openFrameworks
Write-Host "⌛ Downloading openFrameworks`n"
Invoke-WebRequest -Uri "https://github.com/openframeworks/openFrameworks/archive/refs/tags/$OF_VERSION.zip" -OutFile "openFrameworks.zip"
Expand-Archive -Path "openFrameworks.zip" -DestinationPath .\
Remove-Item -Path "openFrameworks.zip" -Force
robocopy /move /E /nfl /ndl "openFrameworks-$OF_VERSION" .\ *

# Remove unnecessary files
Write-Host "`n🗑️ Removing unnecessary files`n"
Remove-Item -Path ".*" -Recurse -Force
Remove-Item -Path "docs", "examples", "tests", "other" -Recurse -Force
Remove-Item -Path "INSTALL_FROM_GITHUB.md", "CODE_OF_CONDUCT.md", "CHANGELOG.md", "THANKS.md", "CONTRIBUTING.md" -Force
Remove-Item -Path "apps\*" -Recurse -Force

# gitignore
Write-Host "⌛ Creating .gitignore`n"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/nandenjin/ofCrossSetup/dev/templates/gitignore" -OutFile ".gitignore"

# Create gitkeep
Write-Host "`n🗑️ Creating .gitkeep`n"
New-Item -Path "apps" -ItemType Directory -Force | Out-Null
New-Item -Path "apps\.gitkeep" -ItemType File -Force | Out-Null
New-Item -Path "projectGenerator" -ItemType Directory -Force | Out-Null
New-Item -Path "projectGenerator\.gitkeep" -ItemType File -Force | Out-Null

# Create install script
Write-Host "`n📦 Creating install scripts`n"
$INSTALL_SCRIPTS = @(
    "install_osx.sh",
    "install_vs.ps1"
)
$installScriptsDir = Join-Path -Path "scripts" -ChildPath "cross_setup"
New-Item -Path $installScriptsDir -ItemType Directory -Force | Out-Null
foreach ($script in $INSTALL_SCRIPTS) {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/nandenjin/ofCrossSetup/dev/templates/scripts/$script" -OutFile (Join-Path -Path $installScriptsDir -ChildPath $script)
    Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted
}

# Create README
Write-Host "`n📝 Creating README`n"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/nandenjin/ofCrossSetup/dev/templates/README.md" | ForEach-Object { $_.ToString().Replace("PROJECT_NAME", $PROJECT_NAME) } | Out-File "README.md" -Encoding utf8

Write-Host "`n✅ Done!`n"
