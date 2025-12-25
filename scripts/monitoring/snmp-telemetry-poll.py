#!/usr/bin/env python3
"""
SNMP Telemetry Poller (Sanitized)
UPS Modernization — Monitoring Script

DESCRIPTION:
    Polls SNMP-enabled devices (UPS, cameras, switches, OT devices)
    and outputs structured JSON telemetry for dashboards or log collectors.

RELATED DOCUMENTATION:
    /docs/ups-modernization-playbook.md
    /docs/camera-support-runbook.md
    /docs/sick-laser-maintenance.md
    /config/snmp-profile-template.md
    /config/ups-monitoring-template.md

NOTES:
    - All OIDs are sanitized placeholders.
    - Replace <SNMP_RO_STRING> with your read-only community string.
    - Replace <OID_*> values with vendor-specific OIDs as needed.
"""

import json
import time
import subprocess
from datetime import datetime

# -----------------------------
#  Configuration (Sanitized)
# -----------------------------

COMMUNITY = "<SNMP_RO_STRING>"
POLL_INTERVAL = 60  # seconds

DEVICES = [
    {
        "name": "UPS-01",
        "ip": "192.168.x.x",
        "type": "ups",
        "oids": {
            "runtime": "1.3.x.x.x",
            "load": "1.3.x.x.x",
            "battery": "1.3.x.x.x",
            "temperature": "1.3.x.x.x"
        }
    },
    {
        "name": "CAM-01",
        "ip": "192.168.x.x",
        "type": "camera",
        "oids": {
            "bitrate": "1.3.x.x.x",
            "poe": "1.3.x.x.x",
            "uptime": "1.3.x.x.x"
        }
    }
]

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

        if "Timeout" in result or result == "":
            return None

        return result.split(":", 1)[-1].strip()

    except Exception:
        return None


def collect_device_telemetry(device):
    """Polls all OIDs for a device and returns a structured dict."""
    telemetry = {
        "device": device["name"],
        "ip": device["ip"],
        "type": device["type"],
        "timestamp": datetime.utcnow().isoformat(),
        "metrics": {}
    }

    for metric, oid in device["oids"].items():
        value = snmp_get(device["ip"], oid)
        telemetry["metrics"][metric] = value if value else "UNREACHABLE"

    return telemetry


def print_json(data):
    """Pretty-print JSON output."""
    print(json.dumps(data, indent=4))


# -----------------------------
#  Main Polling Loop
# -----------------------------

def main():
    print("\n=== SNMP Telemetry Poller Started ===\n")

    while True:
        all_telemetry = []

        for device in DEVICES:
            telemetry = collect_device_telemetry(device)
            all_telemetry.append(telemetry)

        print_json(all_telemetry)
        print("\n--- Poll cycle complete ---\n")

        time.sleep(POLL_INTERVAL)


if __name__ == "__main__":
    main()
