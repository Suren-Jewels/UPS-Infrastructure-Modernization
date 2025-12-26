#!/usr/bin/env python3
"""
Site Baseline Export Tool (Sanitized)
UPS Modernization — Utility Script

DESCRIPTION:
    Generates a standardized site baseline export including:
        - Device inventory (UPS, switches, cameras, APs, OT devices)
        - VLAN summary
        - SNMP reachability sampling
        - JSON + CSV output for documentation or onboarding
        - Supports site readiness validation and modernization planning

RELATED DOCUMENTATION:
    /docs/deployment-overview.md
    /docs/runbook.md
    /config/site-baseline-template.md
    /config/snmp-profile-template.md

NOTES:
    - All IPs, OIDs, and VLANs are sanitized placeholders.
    - Replace <SNMP_RO_STRING> with your read-only community string.
"""

import csv
import json
import subprocess
from datetime import datetime

# -----------------------------
#  Configuration (Sanitized)
# -----------------------------

COMMUNITY = "<SNMP_RO_STRING>"

DEVICES = [
    {"name": "SW-CORE-01", "ip": "192.168.x.x", "type": "switch"},
    {"name": "UPS-01", "ip": "192.168.x.x", "type": "ups"},
    {"name": "CAM-DOCK-01", "ip": "192.168.x.x", "type": "camera"},
    {"name": "AP-AISLE-01", "ip": "192.168.x.x", "type": "access_point"},
    {"name": "ENC-AISLE-01", "ip": "192.168.x.x", "type": "encoder"},
]

VLAN_SUMMARY = {
    "CORP_VLAN": "<CORP_VLAN>",
    "GUEST_VLAN": "<GUEST_VLAN>",
    "VOICE_VLAN": "<VOICE_VLAN>",
    "CAMERA_VLAN": "<CAMERA_VLAN>",
    "OT_VLAN": "<OT_VLAN>",
    "PRINTER_VLAN": "<PRINTER_VLAN>"
}

OUTPUT_JSON = "site-baseline.json"
OUTPUT_CSV = "site-baseline.csv"

# -----------------------------
#  Utility Functions
# -----------------------------

def snmp_reachable(ip):
    """Checks SNMP reachability using a sanitized OID."""
    try:
        result = subprocess.check_output(
            ["snmpget", "-v2c", "-c", COMMUNITY, ip, "1.3.x.x.x"],
            stderr=subprocess.DEVNULL
        ).decode().strip()

        return "Timeout" not in result and result != ""
    except Exception:
        return False


def build_device_record(device):
    """Builds a structured device record."""
    reachable = snmp_reachable(device["ip"])

    return {
        "name": device["name"],
        "ip": device["ip"],
        "type": device["type"],
        "snmp_reachable": reachable,
        "timestamp": datetime.utcnow().isoformat()
    }


def export_json(records):
    """Exports baseline to JSON."""
    with open(OUTPUT_JSON, "w") as f:
        json.dump(records, f, indent=4)


def export_csv(records):
    """Exports baseline to CSV."""
    with open(OUTPUT_CSV, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["name", "ip", "type", "snmp_reachable", "timestamp"])

        for r in records:
            writer.writerow([
                r["name"],
                r["ip"],
                r["type"],
                r["snmp_reachable"],
                r["timestamp"]
            ])


# -----------------------------
#  Main Execution
# -----------------------------

def main():
    print("\n=== Site Baseline Export ===\n")

    baseline = {
        "timestamp": datetime.utcnow().isoformat(),
        "vlans": VLAN_SUMMARY,
        "devices": []
    }

    print("Collecting device inventory...")

    for device in DEVICES:
        record = build_device_record(device)
        baseline["devices"].append(record)
        print(f"  {device['name']} ({device['ip']}): "
              f"{'Reachable' if record['snmp_reachable'] else 'Unreachable'}")

    print("\nExporting JSON baseline...")
    export_json(baseline)

    print("Exporting CSV baseline...")
    export_csv(baseline["devices"])

    print("\nBaseline export complete.")
    print(f"JSON: {OUTPUT_JSON}")
    print(f"CSV : {OUTPUT_CSV}\n")


if __name__ == "__main__":
    main()
