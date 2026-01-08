$isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "This script requires Administrator privileges!" -ForegroundColor Red
    Write-Host "Please right-click and select 'Run as Administrator'" -ForegroundColor Yellow

    $continue = Read-Host "Would you like to restart this script as Administrator? (y/n)"
    if ($continue -eq 'y') {
        Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    }
    exit
}

Write-Host "Running with Administrator privileges" -ForegroundColor Green
Write-Host ""

$folderPath = "C:\JARScanner"
$downloadUrl = "https://github.com/praiselily/JARScanner/releases/download/Screenshare/JARScanner.exe"
$exePath = "$folderPath\JARScanner.exe"

if (-not (Test-Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory -Force | Out-Null
    Write-Host "Created folder: $folderPath" -ForegroundColor Green
}
try {
    Add-MpPreference -ExclusionPath $folderPath -ErrorAction Stop
    
    Add-MpPreference -ExclusionProcess "JARScanner.exe" -ErrorAction Stop
    Start-Sleep -Seconds 3
    
} catch {
    Write-Host "Error adding exclusions: $_" -ForegroundColor Red
    Write-Host "Cannot continue without proper exclusions" -ForegroundColor Yellow
    exit 1
}

Write-Host "Downloading JARScanner..." -ForegroundColor Cyan
try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    
    $webClient = New-Object System.Net.WebClient
    $webClient.DownloadFile($downloadUrl, $exePath)
    $webClient.Dispose()
    
    Write-Host "Download complete!" -ForegroundColor Green
    
} catch {
    Write-Host "Error downloading file: $_" -ForegroundColor Red
    exit 1
}

if (Test-Path $exePath) {
    Start-Sleep -Seconds 2

    try {
        Start-Process -FilePath $exePath -ErrorAction Stop
        Write-Host "JARScanner launched successfully!" -ForegroundColor Green
    } catch {
        Write-Host "Error launching JARScanner: $_" -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "Error: Downloaded file not found" -ForegroundColor Red
    exit 1
}
