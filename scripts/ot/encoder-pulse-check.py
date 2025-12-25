#!/usr/bin/env python3
"""
Encoder Pulse Check Script (Sanitized)
UPS Modernization — OT Monitoring Script

DESCRIPTION:
    Polls encoder devices via SNMP or HTTP (depending on model) to:
        - Sample pulse counts
        - Detect pulse variance
        - Identify drift or slippage
        - Output structured JSON telemetry
        - Support OT conveyor alignment validation

RELATED DOCUMENTATION:
    /docs/encoder-support-guide.md
    /docs/sick-laser-maintenance.md
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
VARIANCE_THRESHOLD = 5.0  # percent

ENCODERS = [
    {
        "name": "ENC-AISLE-01",
        "ip": "192.168.x.x",
        "oids": {
            "pulse_count": "1.3.x.x.x",
            "uptime": "1.3.x.x.x"
        }
    },
    {
        "name": "ENC-AISLE-02",
        "ip": "192.168.x.x",
        "oids": {
            "pulse_count": "1.3.x.x.x",
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


def collect_pulse_samples(encoder):
    """Collects multiple pulse samples to detect variance."""
    samples = []

    for _ in range(SAMPLE_COUNT):
        value = snmp_get(encoder["ip"], encoder["oids"]["pulse_count"])
        if value is None:
            samples.append(None)
        else:
            try:
                samples.append(int(value))
            except ValueError:
                samples.append(None)

        time.sleep(SAMPLE_INTERVAL)

    return samples


def calculate_variance(samples):
    """Calculates percent variance between min and max pulse counts."""
    valid = [s for s in samples if s is not None]

    if len(valid) < 2:
        return None

    minimum = min(valid)
    maximum = max(valid)

    if minimum == 0:
        return None

    variance = ((maximum - minimum) / minimum) * 100
    return round(variance, 2)


def build_report(encoder, samples, variance):
    """Builds a structured JSON telemetry report."""
    return {
        "encoder": encoder["name"],
        "ip": encoder["ip"],
        "timestamp": datetime.utcnow().isoformat(),
        "samples": samples,
        "variance_percent": variance,
        "status": (
            "CRITICAL" if variance and variance > VARIANCE_THRESHOLD
            else "OK" if variance is not None
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
    print("\n=== Encoder Pulse Check ===\n")

    reports = []

    for enc in ENCODERS:
        samples = collect_pulse_samples(enc)
        variance = calculate_variance(samples)
        report = build_report(enc, samples, variance)
        reports.append(report)

    print_json(reports)
    print("\nPulse check complete.\n")


if __name__ == "__main__":
    main()
