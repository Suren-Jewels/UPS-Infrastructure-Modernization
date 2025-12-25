#!/usr/bin/env python3
"""
SICK Laser Alignment Check (Sanitized)
UPS Modernization — OT Monitoring Script

DESCRIPTION:
    Polls SICK laser devices via SNMP or HTTP (depending on model) to:
        - Sample alignment values
        - Detect drift or misalignment
        - Parse error codes
        - Output structured JSON telemetry
        - Support OT conveyor alignment and safety validation

RELATED DOCUMENTATION:
    /docs/sick-laser-maintenance.md
    /docs/encoder-support-guide.md
    /docs/deployment-overview.md
    /config/ot-vlan-template.md
    /config/snmp-profile-template.md

NOTES:
    - All OIDs and endpoints are sanitized placeholders.
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
SAMPLE_INTERVAL = 2       # seconds
SAMPLE_COUNT = 5          # number of samples per run
DRIFT_THRESHOLD = 3.0     # degrees
ERROR_CODES = {
    "0": "OK",
    "1": "Low Signal",
    "2": "Obstruction Detected",
    "3": "Alignment Fault",
    "4": "Hardware Error"
}

LASERS = [
    {
        "name": "SICK-DOCK-01",
        "ip": "192.168.x.x",
        "oids": {
            "alignment": "1.3.x.x.x",
            "error_code": "1.3.x.x.x",
            "uptime": "1.3.x.x.x"
        }
    },
    {
        "name": "SICK-AISLE-02",
        "ip": "192.168.x.x",
        "oids": {
            "alignment": "1.3.x.x.x",
            "error_code": "1.3.x.x.x",
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

        if not result or "Timeout" in result:
            return None

        return result.split(":", 1)[-1].strip()

    except Exception:
        return None


def collect_alignment_samples(laser):
    """Collects multiple alignment samples to detect drift."""
    samples = []

    for _ in range(SAMPLE_COUNT):
        value = snmp_get(laser["ip"], laser["oids"]["alignment"])
        if value is None:
            samples.append(None)
        else:
            try:
                samples.append(float(value))
            except ValueError:
                samples.append(None)

        time.sleep(SAMPLE_INTERVAL)

    return samples


def calculate_drift(samples):
    """Calculates drift between min and max alignment values."""
    valid = [s for s in samples if s is not None]

    if len(valid) < 2:
        return None

    minimum = min(valid)
    maximum = max(valid)

    drift = abs(maximum - minimum)
    return round(drift, 2)


def parse_error_code(code):
    """Maps error code to human-readable description."""
    if code is None:
        return "UNREACHABLE"

    return ERROR_CODES.get(code.strip(), "UNKNOWN")


def build_report(laser, samples, drift, error_code):
    """Builds a structured JSON telemetry report."""
    return {
        "laser": laser["name"],
        "ip": laser["ip"],
        "timestamp": datetime.utcnow().isoformat(),
        "samples": samples,
        "drift_degrees": drift,
        "error_code": error_code,
        "error_description": parse_error_code(error_code),
        "status": (
            "CRITICAL" if drift and drift > DRIFT_THRESHOLD or error_code not in ["0", None]
            else "OK" if drift is not None
            else "UNREACHABLE"
        )
    }


def print_json(data):
    """Pretty-print JSON output."""
    print(json.dumps(data, indent=4))


# -----------------------------
#  Main Execution
# -----------------------------

def main():
    print("\n=== SICK Laser Alignment Check ===\n")

    reports = []

    for laser in LASERS:
        samples = collect_alignment_samples(laser)
        drift = calculate_drift(samples)
        error_code = snmp_get(laser["ip"], laser["oids"]["error_code"])
        report = build_report(laser, samples, drift, error_code)
        reports.append(report)

    print_json(reports)
    print("\nAlignment check complete.\n")


if __name__ == "__main__":
    main()
