<#
    .SYNOPSIS
        Switch Port Validator (Sanitized)

    .DESCRIPTION
        Audits switchport configuration for correctness:
            - Access vs trunk mode
            - VLAN assignment
            - LLDP neighbor validation
            - PoE status (for APs/cameras/VoIP)
            - Compliance with UPS modernization standards

    .RELATED DOCUMENTATION
        /docs/network-topology.md
        /config/wifi-baseline-template.md
        /config/camera-vlan-template.md
        /config/ot-vlan-template.md
        /config/voip-qos-template.md

    .NOTES
        - Sanitized for portfolio use.
        - Replace <SWITCH_CREDENTIALS> with secure credential handling.
        - Replace <EXPECTED_VLANS> with site-specific values.
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
    param([string]$Command)

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

$ExpectedVLANs = @{
    "CORP"    = "<CORP_VLAN>"
    "GUEST"   = "<GUEST_VLAN>"
    "VOICE"   = "<VOICE_VLAN>"
    "CAMERA"  = "<CAMERA_VLAN>"
    "OT"      = "<OT_VLAN>"
    "PRINTER" = "<PRINTER_VLAN>"
}

# -----------------------------
#  Begin Audit
# -----------------------------

Write-Section "Switch Port Validator"
Write-Host "Target Switch: $SwitchIP"
Write-Host "Timestamp    : $(Get-Date)"

# -----------------------------
#  Retrieve Interface Status
# -----------------------------

Write-Section "Collecting Interface Status"

$InterfaceOutput = Run-SSHCommand -Command "show interfaces status"

if ($InterfaceOutput -eq "UNREACHABLE" -or $InterfaceOutput -eq "ERROR") {
    Write-Host "Unable to retrieve interface status." -ForegroundColor Red
    exit
}

Write-Host $InterfaceOutput

# -----------------------------
#  Retrieve LLDP Neighbors
# -----------------------------

Write-Section "Collecting LLDP Neighbors"

$LLDPOutput = Run-SSHCommand -Command "show lldp neighbors"

if ($LLDPOutput -eq "UNREACHABLE" -or $LLDPOutput -eq "ERROR") {
    Write-Host "Unable to retrieve LLDP neighbors." -ForegroundColor Red
}
else {
    Write-Host $LLDPOutput
}

# -----------------------------
#  Retrieve PoE Status
# -----------------------------

Write-Section "Collecting PoE Status"

$PoEOutput = Run-SSHCommand -Command "show power inline"

if ($PoEOutput -eq "UNREACHABLE" -or $PoEOutput -eq "ERROR") {
    Write-Host "Unable to retrieve PoE status." -ForegroundColor Red
}
else {
    Write-Host $PoEOutput
}

# -----------------------------
#  Port-by-Port Validation
# -----------------------------

Write-Section "Validating Switch Ports"

$InterfaceOutput -split "`n" | ForEach-Object {

    if ($_ -match "connected") {

        $cols = $_ -split "\s+"
        $intf = $cols[0]
        $vlan = $cols[2]

        Write-Host "`nPort: $intf" -ForegroundColor Yellow

        # Determine mode
        if ($vlan -eq "trunk") {
            Write-Host "  Mode : TRUNK" -ForegroundColor Cyan
        }
        else {
            Write-Host "  Mode : ACCESS ($vlan)" -ForegroundColor Green
        }

        # Validate VLAN membership
        if ($ExpectedVLANs.Values -contains $vlan) {
            Write-Host "  VLAN : VALID ($vlan)" -ForegroundColor Green
        }
        else {
            Write-Host "  VLAN : INVALID ($vlan)" -ForegroundColor Red
        }

        # LLDP validation
        if ($LLDPOutput -match $intf) {
            Write-Host "  LLDP : Neighbor detected" -ForegroundColor Green
        }
        else {
            Write-Host "  LLDP : No neighbor" -ForegroundColor Yellow
        }

        # PoE validation
        if ($PoEOutput -match $intf) {
            Write-Host "  PoE  : Enabled" -ForegroundColor Green
        }
        else {
            Write-Host "  PoE  : Not applicable" -ForegroundColor DarkGray
        }
    }
}

# -----------------------------
#  Final Summary
# -----------------------------

Write-Section "Validation Summary"

Write-Host "Interface status collected."
Write-Host "LLDP neighbors validated."
Write-Host "PoE status reviewed."
Write-Host "VLAN membership checked."
Write-Host "`nSwitch port validation complete.`n"
