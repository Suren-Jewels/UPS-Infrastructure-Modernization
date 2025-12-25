#!/usr/bin/env python3
"""
Camera Bitrate Audit Script (Sanitized)
UPS Modernization — Monitoring Script

DESCRIPTION:
    Polls IP cameras via SNMP to retrieve bitrate, PoE draw, and uptime.
    Evaluates bitrate against standardized thresholds and outputs a
    structured JSON report for dashboards or log collectors.

RELATED DOCUMENTATION:
    /docs/camera-support-runbook.md
    /docs/deployment-overview.md
    /config/camera-vlan-template.md
    /config/snmp-profile-template.md

NOTES:
    - All OIDs are sanitized placeholders.
    - Replace <SNMP_RO_STRING> with your read-only community string.
    - Replace <OID_*> values with vendor-specific OIDs as needed.
"""

import json
import subprocess
from datetime import datetime

# -----------------------------
#  Configuration (Sanitized)
# -----------------------------

COMMUNITY = "<SNMP_RO_STRING>"

CAMERAS = [
    {
        "name": "CAM-DOCK-01",
        "ip": "192.168.x.x",
        "oids": {
            "bitrate": "1.3.x.x.x",
            "poe": "1.3.x.x.x",
            "uptime": "1.3.x.x.x"
        }
    },
    {
        "name": "CAM-AISLE-02",
        "ip": "192.168.x.x",
        "oids": {
            "bitrate": "1.3.x.x.x",
            "poe": "1.3.x.x.x",
            "uptime": "1.3.x.x.x"
        }
    }
]

# Standardized thresholds (sanitized)
BITRATE_WARNING = 8    # Mbps
BITRATE_CRITICAL = 12  # Mbps


# -----------------------------
#  Utility Functions
# -----------------------------

def snmp_get(ip, oid):
    """Executes an SNMP GET and returns the raw value."""
    try:
        result = subprocess.check_output(
            ["snmpget", "-v2c", "-c", COMMUNITY, ip, oid],
            stderr=subprocess.DEVNULL
        ).decode().strip()

        if not result or "Timeout" in result:
            return None

        return result.split(":", 1)[-1].strip()

    except Exception:
        return None


def evaluate_bitrate(value):
    """Evaluates bitrate against thresholds."""
    if value is None:
        return "UNREACHABLE"

    try:
        bitrate = float(value)
    except ValueError:
        return "INVALID"

    if bitrate >= BITRATE_CRITICAL:
        return "CRITICAL"
    elif bitrate >= BITRATE_WARNING:
        return "WARNING"
    else:
        return "OK"


def collect_camera_telemetry(camera):
    """Polls all OIDs for a camera and returns a structured dict."""
    telemetry = {
        "camera": camera["name"],
        "ip": camera["ip"],
        "timestamp": datetime.utcnow().isoformat(),
        "metrics": {},
        "status": {}
    }

    # Poll metrics
    bitrate = snmp_get(camera["ip"], camera["oids"]["bitrate"])
    poe = snmp_get(camera["ip"], camera["oids"]["poe"])
    uptime = snmp_get(camera["ip"], camera["oids"]["uptime"])

    telemetry["metrics"]["bitrate_mbps"] = bitrate
    telemetry["metrics"]["poe_watts"] = poe
    telemetry["metrics"]["uptime"] = uptime

    # Evaluate bitrate
    telemetry["status"]["bitrate"] = evaluate_bitrate(bitrate)

    return telemetry


def print_json(data):
    """Pretty-print JSON output."""
    print(json.dumps(data, indent=4))


# -----------------------------
#  Main Execution
# -----------------------------

def main():
    print("\n=== Camera Bitrate Audit ===\n")

    all_telemetry = []

    for cam in CAMERAS:
        telemetry = collect_camera_telemetry(cam)
        all_telemetry.append(telemetry)

    print_json(all_telemetry)
    print("\nAudit complete.\n")


if __name__ == "__main__":
    main()
