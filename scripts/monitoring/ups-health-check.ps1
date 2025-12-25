<#
    .SYNOPSIS
        UPS Health Check Script (Sanitized)

    .DESCRIPTION
        Performs a standardized health check against a UPS device using SNMP.
        Validates runtime, load, battery health, temperature, and input/output voltage.
        Outputs a structured health report for monitoring or troubleshooting.

    .RELATED DOCUMENTATION
        /docs/ups-modernization-playbook.md
        /docs/runbook.md
        /config/ups-monitoring-template.md
        /config/snmp-profile-template.md

    .NOTES
        - All OIDs are sanitized placeholders.
        - Replace <SNMP_RO_STRING> with your read-only community string.
        - Replace <OID_*> values with vendor-specific OIDs as needed.
#>

param(
    [Parameter(Mandatory = $true)]
    [string]$UPSIP,

    [Parameter(Mandatory = $false)]
    [string]$CommunityString = "<SNMP_RO_STRING>"
)

# -----------------------------
#  Utility Functions
# -----------------------------

function Write-Section {
    param([string]$Title)
    Write-Host "`n==== $Title ====" -ForegroundColor Cyan
}

function Get-SNMPValue {
    param(
        [string]$OID,
        [string]$Description
    )

    try {
        $value = snmpget -v2c -c $CommunityString $UPSIP $OID 2>$null

        if (-not $value) {
            return @{
                Description = $Description
                Value       = "N/A"
                Status      = "UNREACHABLE"
            }
        }

        return @{
            Description = $Description
            Value       = $value
            Status      = "OK"
        }
    }
    catch {
        return @{
            Description = $Description
            Value       = "ERROR"
            Status      = "FAILED"
        }
    }
}

# -----------------------------
#  SNMP OID Definitions (Sanitized)
# -----------------------------

$OIDs = @{
    Runtime        = "1.3.x.x.x"   # Remaining runtime (minutes)
    Load           = "1.3.x.x.x"   # Load percentage
    BatteryHealth  = "1.3.x.x.x"   # Battery condition
    Temperature    = "1.3.x.x.x"   # Internal UPS temperature
    InputVoltage   = "1.3.x.x.x"   # Incoming voltage
    OutputVoltage  = "1.3.x.x.x"   # Output voltage
}

# -----------------------------
#  Begin Health Check
# -----------------------------

Write-Section "UPS Health Check"
Write-Host "Target UPS: $UPSIP"
Write-Host "Timestamp : $(Get-Date)"


# -----------------------------
#  Collect Metrics
# -----------------------------

$results = @()

$results += Get-SNMPValue -OID $OIDs.Runtime       -Description "Runtime (min)"
$results += Get-SNMPValue -OID $OIDs.Load          -Description "Load (%)"
$results += Get-SNMPValue -OID $OIDs.BatteryHealth -Description "Battery Health"
$results += Get-SNMPValue -OID $OIDs.Temperature   -Description "Temperature (F)"
$results += Get-SNMPValue -OID $OIDs.InputVoltage  -Description "Input Voltage"
$results += Get-SNMPValue -OID $OIDs.OutputVoltage -Description "Output Voltage"


# -----------------------------
#  Output Results
# -----------------------------

Write-Section "UPS Telemetry Results"

foreach ($item in $results) {
    $color = switch ($item.Status) {
        "OK"          { "Green" }
        "UNREACHABLE" { "Yellow" }
        "FAILED"      { "Red" }
        default       { "White" }
    }

    Write-Host ("{0,-20} {1,-10} [{2}]" -f $item.Description, $item.Value, $item.Status) -ForegroundColor $color
}

# -----------------------------
#  Threshold Evaluation (Sanitized)
# -----------------------------

Write-Section "Threshold Evaluation"

function Evaluate-Threshold {
    param(
        [string]$Metric,
        [string]$Value,
        [int]$Warning,
        [int]$Critical
    )

    if ($Value -eq "N/A" -or $Value -eq "ERROR") {
        Write-Host "$Metric: Unable to evaluate" -ForegroundColor Yellow
        return
    }

    $num = [int]$Value

    if ($num -le $Critical) {
        Write-Host "$Metric: CRITICAL ($num)" -ForegroundColor Red
    }
    elseif ($num -le $Warning) {
        Write-Host "$Metric: WARNING ($num)" -ForegroundColor Yellow
    }
    else {
        Write-Host "$Metric: OK ($num)" -ForegroundColor Green
    }
}

Evaluate-Threshold -Metric "Runtime" -Value $results[0].Value -Warning 20 -Critical 10
Evaluate-Threshold -Metric "Load"    -Value $results[1].Value -Warning 70 -Critical 85

Write-Host "`nHealth check complete.`n"
