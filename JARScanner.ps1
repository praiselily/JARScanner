$folderPath = "C:\JARScanner"
$downloadUrl = "https://github.com/praiselily/JARScanner/releases/download/Screenshare/JARScanner.exe"
$exePath = "$folderPath\JARScanner.exe"

if (-not (Test-Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory -Force | Out-Null
    Write-Host "Created folder: $folderPath" -ForegroundColor Green
}

try {
    Add-MpPreference -ExclusionPath $folderPath
    Write-Host "$folderPath" -ForegroundColor Green
} catch {
    Write-Host "Warning: Import failed. Error: $_" -ForegroundColor Yellow
}

Write-Host "Downloading JARScanner..." -ForegroundColor Cyan
try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -Uri $downloadUrl -OutFile $exePath -UseBasicParsing
    Write-Host "Download complete!" -ForegroundColor Green
} catch {
    Write-Host "Error downloading file: $_" -ForegroundColor Red
    exit 1
}
if (Test-Path $exePath) {
    Start-Process -FilePath $exePath -Verb RunAs
} else {
    exit 1
}
