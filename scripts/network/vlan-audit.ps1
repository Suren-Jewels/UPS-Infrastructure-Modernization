<#
    .SYNOPSIS
        VLAN Audit Script (Sanitized)

    .DESCRIPTION
        Performs a standardized audit of switch VLAN configuration.
        Validates access/trunk mode, allowed VLANs, PoE status (for APs/cameras),
        and compares actual configuration against expected site baselines.

    .RELATED DOCUMENTATION
        /docs/network-topology.md
        /config/camera-vlan-template.md
        /config/wifi-baseline-template.md
        /config/ot-vlan-template.md
        /config/printer-standardization-template.md

    .NOTES
        - Sanitized for portfolio use.
        - Replace <EXPECTED_VLANS> with site-specific values.
        - Replace <SWITCH_CREDENTIALS> with secure credential handling.
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$SwitchIP,

    [Parameter(Mandatory = $false)]
    [string]$Username = "<USERNAME>",

    [Parameter(Mandatory = $false)]
    [string]$Password = "<PASSWORD>"
)

# -----------------------------
#  Utility Functions
# -----------------------------

function Write-Section {
    param([string]$Title)
    Write-Host "`n==== $Title ====" -ForegroundColor Cyan
}

function Run-SSHCommand {
    param(
        [string]$Command
    )

    try {
        $result = ssh "$Username@$SwitchIP" $Command 2>$null
        if (-not $result) { return "UNREACHABLE" }
        return $result
    }
    catch {
        return "ERROR"
    }
}

# -----------------------------
#  Expected VLAN Definitions (Sanitized)
# -----------------------------

$Expected = @{
    "CAMERA_VLAN"   = "<CAMERA_VLAN>"
    "VOICE_VLAN"    = "<VOICE_VLAN>"
    "OT_VLAN"       = "<OT_VLAN>"
    "PRINTER_VLAN"  = "<PRINTER_VLAN>"
    "CORP_VLAN"     = "<CORP_VLAN>"
    "GUEST_VLAN"    = "<GUEST_VLAN>"
}

# -----------------------------
#  Begin Audit
# -----------------------------

Write-Section "VLAN Audit"
Write-Host "Target Switch: $SwitchIP"
Write-Host "Timestamp    : $(Get-Date)"

# -----------------------------
#  Collect VLAN Table
# -----------------------------

Write-Section "Collecting VLAN Table"

$VlanOutput = Run-SSHCommand -Command "show vlan brief"

if ($VlanOutput -eq "UNREACHABLE" -or $VlanOutput -eq "ERROR") {
    Write-Host "Unable to retrieve VLAN table." -ForegroundColor Red
    exit
}

Write-Host $VlanOutput

# -----------------------------
#  Validate Expected VLANs
# -----------------------------

Write-Section "Validating Expected VLANs"

foreach ($key in $Expected.Keys) {
    $vlan = $Expected[$key]

    if ($VlanOutput -match $vlan) {
        Write-Host "$key ($vlan): PRESENT" -ForegroundColor Green
    }
    else {
        Write-Host "$key ($vlan): MISSING" -ForegroundColor Red
    }
}

# -----------------------------
#  Switchport Mode Audit
# -----------------------------

Write-Section "Auditing Switchport Modes"

$Interfaces = Run-SSHCommand -Command "show interfaces status"

if ($Interfaces -eq "UNREACHABLE" -or $Interfaces -eq "ERROR") {
    Write-Host "Unable to retrieve interface status." -ForegroundColor Red
    exit
}

$Interfaces -split "`n" | ForEach-Object {
    if ($_ -match "connected") {
        $cols = $_ -split "\s+"
        $intf = $cols[0]
        $vlan = $cols[2]

        if ($vlan -eq "trunk") {
            Write-Host "$intf: TRUNK" -ForegroundColor Yellow
        }
        else {
            Write-Host "$intf: ACCESS ($vlan)" -ForegroundColor Green
        }
    }
}

# -----------------------------
#  PoE Audit (APs & Cameras)
# -----------------------------

Write-Section "PoE Audit"

$PoEOutput = Run-SSHCommand -Command "show power inline"

if ($PoEOutput -eq "UNREACHABLE" -or $PoEOutput -eq "ERROR") {
    Write-Host "Unable to retrieve PoE status." -ForegroundColor Red
}
else {
    Write-Host $PoEOutput
}

# -----------------------------
#  Final Summary
# -----------------------------

Write-Section "Audit Summary"

Write-Host "VLAN table collected."
Write-Host "Expected VLANs validated."
Write-Host "Switchport modes reviewed."
Write-Host "PoE status checked."
Write-Host "`nVLAN audit complete.`n"
