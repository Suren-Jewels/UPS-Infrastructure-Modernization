#!/bin/bash
#
# Wi‑Fi Coverage Scan (Sanitized)
# UPS Modernization — Network Script
#
# DESCRIPTION:
#     Performs a lightweight Wi‑Fi coverage scan to validate:
#       - RSSI levels
#       - AP association
#       - Channel utilization
#       - Band preference (2.4 / 5 GHz)
#
# RELATED DOCUMENTATION:
#     /docs/wifi-expansion-guide.md
#     /docs/deployment-overview.md
#     /config/wifi-baseline-template.md
#
# NOTES:
#     - Sanitized for portfolio use.
#     - Requires Linux/macOS with `airport` or `iwlist` available.
#

# -----------------------------
#  Utility Functions
# -----------------------------

print_section() {
    echo ""
    echo "==== $1 ===="
}

# -----------------------------
#  Detect Platform
# -----------------------------

if command -v airport >/dev/null 2>&1; then
    PLATFORM="mac"
elif command -v iwlist >/dev/null 2>&1; then
    PLATFORM="linux"
else
    echo "No supported Wi‑Fi scanning tools found."
    exit 1
fi

print_section "Wi‑Fi Coverage Scan"
echo "Platform : $PLATFORM"
echo "Timestamp: $(date)"

# -----------------------------
#  macOS Scan
# -----------------------------

scan_mac() {
    print_section "Scanning Wi‑Fi Networks (macOS)"
    sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -s
}

# -----------------------------
#  Linux Scan
# -----------------------------

scan_linux() {
    print_section "Scanning Wi‑Fi Networks (Linux)"
    sudo iwlist scanning 2>/dev/null | grep -E "ESSID|Signal level|Channel"
}

# -----------------------------
#  Execute Scan
# -----------------------------

if [ "$PLATFORM" = "mac" ]; then
    scan_mac
else
    scan_linux
fi

# -----------------------------
#  AP Association Check
# -----------------------------

print_section "Current AP Association"

if [ "$PLATFORM" = "mac" ]; then
    airport -I | grep -E "SSID|BSSID|agrCtlRSSI|channel"
else
    iwconfig 2>/dev/null | grep -E "ESSID|Access Point|Signal level|Frequency"
fi

# -----------------------------
#  Channel Utilization (macOS only)
# -----------------------------

if [ "$PLATFORM" = "mac" ]; then
    print_section "Channel Utilization (macOS)"
    airport --channelinfo
fi

# -----------------------------
#  Final Output
# -----------------------------

print_section "Scan Complete"
echo "Review RSSI, channel, and AP association to validate coverage."
echo ""
