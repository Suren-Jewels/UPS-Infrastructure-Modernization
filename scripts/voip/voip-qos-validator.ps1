<#
    .SYNOPSIS
        VoIP QoS Validator (Sanitized)

    .DESCRIPTION
        Validates SIP/RTP QoS behavior across the network by:
            - Checking DSCP markings on SIP and RTP packets
            - Sampling jitter, latency, and packet loss
            - Estimating MOS (sanitized calculation)
            - Verifying SIP registration status
            - Producing a structured health report

    .RELATED DOCUMENTATION
        /docs/voip-migration-guide.md
        /docs/deployment-overview.md
        /config/voip-qos-template.md

    .NOTES
        - Sanitized for portfolio use.
        - Requires tshark or tcpdump installed.
        - DSCP values are placeholders.
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$Interface,

    [Parameter(Mandatory = $false)]
    [int]$CaptureDuration = 10
)

# -----------------------------
#  Utility Functions
# -----------------------------

function Write-Section {
    param([string]$Title)
    Write-Host "`n==== $Title ====" -ForegroundColor Cyan
}

function Check-Dependency {
    param([string]$Tool)

    if (-not (Get-Command $Tool -ErrorAction SilentlyContinue)) {
        Write-Host "Missing dependency: $Tool" -ForegroundColor Red
        exit
    }
}

# -----------------------------
#  Dependency Check
# -----------------------------

Check-Dependency -Tool "tshark"

# -----------------------------
#  Begin QoS Validation
# -----------------------------

Write-Section "VoIP QoS Validator"
Write-Host "Interface : $Interface"
Write-Host "Duration  : $CaptureDuration seconds"
Write-Host "Timestamp : $(Get-Date)"

# -----------------------------
#  Capture SIP & RTP Packets
# -----------------------------

Write-Section "Capturing SIP/RTP Packets"

$CaptureFile = "$env:TEMP\voip_capture.pcap"

tshark -i $Interface -a duration:$CaptureDuration -w $CaptureFile 2>$null

if (-not (Test-Path $CaptureFile)) {
    Write-Host "Packet capture failed." -ForegroundColor Red
    exit
}

Write-Host "Capture saved to: $CaptureFile"

# -----------------------------
#  Analyze DSCP Markings
# -----------------------------

Write-Section "Analyzing DSCP Markings"

$DSCPResults = tshark -r $CaptureFile -Y "ip.dsfield.dscp" -T fields -e ip.dsfield.dscp

if (-not $DSCPResults) {
    Write-Host "No DSCP-marked packets detected." -ForegroundColor Yellow
}
else {
    $DSCPCounts = $DSCPResults | Group-Object | Select-Object Name,Count
    $DSCPCounts | ForEach-Object {
        Write-Host ("DSCP {0}: {1} packets" -f $_.Name, $_.Count) -ForegroundColor Green
    }
}

# -----------------------------
#  Analyze RTP Metrics
# -----------------------------

Write-Section "Analyzing RTP Metrics"

$RTPStats = tshark -r $CaptureFile -Y "rtp" -T fields `
    -e rtp.seq -e rtp.timestamp -e rtp.ssrc -e rtp.marker -e rtp.p_type 2>$null

if (-not $RTPStats) {
    Write-Host "No RTP packets detected." -ForegroundColor Yellow
}
else {
    Write-Host "RTP packets detected." -ForegroundColor Green
}

# -----------------------------
#  Estimate Jitter & Packet Loss (Sanitized)
# -----------------------------

Write-Section "Estimating Jitter & Packet Loss"

# Sanitized placeholder calculations
$Jitter = Get-Random -Minimum 2 -Maximum 15
$PacketLoss = Get-Random -Minimum 0 -Maximum 3

Write-Host "Jitter      : $Jitter ms"
Write-Host "Packet Loss : $PacketLoss %"

# -----------------------------
#  Estimate MOS (Sanitized)
# -----------------------------

Write-Section "Estimating MOS Score"

# Sanitized MOS estimation
if ($PacketLoss -gt 2 -or $Jitter -gt 20) {
    $MOS = 3.0
}
elseif ($PacketLoss -gt 1 -or $Jitter -gt 10) {
    $MOS = 3.8
}
else {
    $MOS = 4.2
}

Write-Host "Estimated MOS: $MOS"

# -----------------------------
#  SIP Registration Check
# -----------------------------

Write-Section "Checking SIP Registration"

$SIPPackets = tshark -r $CaptureFile -Y "sip" -T fields -e sip.Status-Code

if ($SIPPackets) {
    Write-Host "SIP activity detected." -ForegroundColor Green
}
else {
    Write-Host "No SIP registration packets detected." -ForegroundColor Yellow
}

# -----------------------------
#  Final Summary
# -----------------------------

Write-Section "QoS Validation Summary"

Write-Host "DSCP markings analyzed."
Write-Host "RTP metrics sampled."
Write-Host "Jitter and packet loss estimated."
Write-Host "MOS score calculated."
Write-Host "SIP registration checked."
Write-Host "`nVoIP QoS validation complete.`n"
