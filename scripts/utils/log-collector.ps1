<#
    .SYNOPSIS
        Unified Log Collector (Sanitized)

    .DESCRIPTION
        Collects system, network, application, and device‑specific logs into a
        single export folder for troubleshooting and escalation.
        Supports Windows and macOS (PowerShell 7+).

    .RELATED DOCUMENTATION
        /docs/troubleshooting-guide.md
        /docs/runbook.md
        /docs/deployment-overview.md

    .NOTES
        - Sanitized for portfolio use.
        - No internal UPS paths or tooling included.
        - Uses only OS‑native log sources.
#>

param(
    [Parameter(Mandatory = $false)]
    [string]$OutputPath = "$env:TEMP\FixWareLogs",

    [Parameter(Mandatory = $false)]
    [switch]$IncludeNetwork
)

# -----------------------------
#  Utility Functions
# -----------------------------

function Write-Section {
    param([string]$Title)
    Write-Host "`n==== $Title ====" -ForegroundColor Cyan
}

function Ensure-Directory {
    param([string]$Path)

    if (-not (Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

# -----------------------------
#  Begin Log Collection
# -----------------------------

Write-Section "FixWare Log Collector"
Write-Host "Output Path: $OutputPath"
Write-Host "Timestamp  : $(Get-Date)"

Ensure-Directory -Path $OutputPath

# -----------------------------
#  OS Detection
# -----------------------------

$IsWindows = $PSVersionTable.OS -match "Windows"
$IsMac     = $PSVersionTable.OS -match "Darwin"

Write-Section "Detected OS"

if ($IsWindows) {
    Write-Host "Windows detected." -ForegroundColor Green
} elseif ($IsMac) {
    Write-Host "macOS detected." -ForegroundColor Green
} else {
    Write-Host "Unsupported OS." -ForegroundColor Red
    exit
}

# -----------------------------
#  Windows Log Collection
# -----------------------------

if ($IsWindows) {

    Write-Section "Collecting Windows Logs"

    # System Event Logs
    wevtutil epl System "$OutputPath\system.evtx"
    wevtutil epl Application "$OutputPath\application.evtx"

    # Network Diagnostics (optional)
    if ($IncludeNetwork) {
        Write-Host "Collecting network diagnostics..."
        ipconfig /all > "$OutputPath\network.txt"
        netsh wlan show interfaces >> "$OutputPath\network.txt"
    }

    # Installed Apps
    Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
        Select-Object DisplayName, DisplayVersion |
        Out-File "$OutputPath\installed-apps.txt"

    # Running Services
    Get-Service | Out-File "$OutputPath\services.txt"
}

# -----------------------------
#  macOS Log Collection
# -----------------------------

if ($IsMac) {

    Write-Section "Collecting macOS Logs"

    # System Log
    log show --style syslog --last 1d > "$OutputPath\system.log"

    # Wi‑Fi Diagnostics (optional)
    if ($IncludeNetwork) {
        Write-Host "Collecting Wi‑Fi diagnostics..."
        /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I \
            > "$OutputPath\wifi.txt"
    }

    # Installed Apps
    system_profiler SPApplicationsDataType > "$OutputPath\installed-apps.txt"

    # Running Processes
    ps aux > "$OutputPath\processes.txt"
}

# -----------------------------
#  Final Output
# -----------------------------

Write-Section "Log Collection Complete"
Write-Host "Logs saved to: $OutputPath"
Write-Host "Package ready for troubleshooting or escalation."
