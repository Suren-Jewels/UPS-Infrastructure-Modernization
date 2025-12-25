# 🧱 Architecture Layers  
**Layered Model for Multi‑Site UPS, Network, and IT/OT Modernization**

This document outlines the layered architecture used across ~10 UPS facilities during the modernization program.  
Each layer represents a functional domain — from power infrastructure to network, voice, security, OT systems, provisioning, and monitoring.

The layered model ensures **standardization**, **repeatability**, and **zero‑downtime modernization** across all sites.

---

## 🔌 Layer 1 — Power & UPS Infrastructure
The foundation of the modernization program.

### Components
- Facility‑wide UPS units (sanitized models)  
- Battery banks (AGM/Lithium depending on site)  
- Bypass panels & transfer switches  
- Environmental sensors (temperature, humidity)  

### Responsibilities
- Maintain continuous power for critical systems  
- Provide runtime stability during outages  
- Enable SNMP‑based telemetry for proactive maintenance  

---

## 🌐 Layer 2 — Network & Switching
The core connectivity layer supporting all IT/OT systems.

### Components
- Cisco Meraki switches (L2/L3)  
- Firewall segmentation  
- PoE distribution for cameras, VoIP, and sensors  
- Fiber/copper uplinks between distribution and access layers  

### Responsibilities
- Provide secure, segmented connectivity  
- Support high‑density warehouse/logistics environments  
- Enable cloud‑managed configuration and monitoring  

---

## 📶 Layer 3 — Wi‑Fi Infrastructure
Wireless coverage for logistics, warehouse, and office zones.

### Components
- Meraki APs  
- RF redesign and heatmap planning  
- Dedicated SSIDs (corporate, guest, OT)  

### Responsibilities
- Ensure stable coverage across large warehouse spaces  
- Support handheld scanners, tablets, and mobile devices  
- Provide WPA2/WPA3 enterprise authentication  

---

## ☎️ Layer 4 — Voice & Communication
Modernized communication systems replacing legacy PBX.

### Components
- SIP‑based VoIP phones  
- VoIP gateways  
- QoS enforcement  
- Voice VLAN segmentation  

### Responsibilities
- Reduce communication costs  
- Improve call quality and reliability  
- Standardize voice infrastructure across all sites  

---

## 🎥 Layer 5 — Security & Surveillance
Modernized camera and NVR infrastructure.

### Components
- IP cameras  
- NVR systems  
- PoE switching  
- Camera VLAN segmentation  

### Responsibilities
- Provide facility‑wide surveillance coverage  
- Isolate camera traffic from corporate networks  
- Support high‑resolution video retention  

---

## 🏭 Layer 6 — OT (Operational Technology)
Industrial systems supporting logistics operations.

### Components
- SICK laser scanners  
- Encoders  
- Industrial sensors  
- OT VLAN segmentation  

### Responsibilities
- Maintain alignment and telemetry for conveyor systems  
- Ensure safe and reliable OT device operation  
- Prevent cross‑traffic between OT and corporate networks  

---

## 🖥️ Layer 7 — Device Provisioning
Standardized deployment of servers, PCs, and laptops.

### Components
- Intune (Windows)  
- Jamf (macOS)  
- Imaging workflows  
- Device provisioning checklists  

### Responsibilities
- Ensure consistent device configuration  
- Enforce security baselines  
- Support onboarding/offboarding workflows  

---

## 📡 Layer 8 — Monitoring & Telemetry
Unified observability across power, network, and OT systems.

### Components
- SNMP polling  
- Alert thresholds (runtime, load, temperature)  
- Network monitoring dashboards (sanitized)  
- Automated health checks  

### Responsibilities
- Detect issues before they impact operations  
- Provide visibility across all modernization layers  
- Support remote troubleshooting and diagnostics  

---

## 🧩 Layer Interaction Model

```
+-----------------------------------------------------------+
|                    Monitoring & Telemetry                 |
+-----------------------------------------------------------+
|                     Device Provisioning                   |
+-----------------------------------------------------------+
|                      OT (Industrial)                      |
+-----------------------------------------------------------+
|                  Security & Surveillance                  |
+-----------------------------------------------------------+
|                   Voice & Communication                   |
+-----------------------------------------------------------+
|                   Wi‑Fi Infrastructure                    |
+-----------------------------------------------------------+
|                Network & Switching (Core)                 |
+-----------------------------------------------------------+
|                 Power & UPS Infrastructure                |
+-----------------------------------------------------------+
```

Each layer builds on the one below it, ensuring stability, security, and scalability across all UPS facilities.

---

## 🔒 Confidentiality Notice
All architectural details are sanitized for portfolio use.  
No internal UPS configurations, IP ranges, or proprietary diagrams are included.
