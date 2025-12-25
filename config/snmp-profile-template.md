# 📡 SNMP Profile Template  
**Standardized SNMP Configuration for UPS, Network, Camera, VoIP & OT Devices**

This template defines the standardized SNMP configuration applied across all modernized UPS facilities.  
It ensures consistent telemetry, secure access, predictable alerting, and unified monitoring across UPS, switches, APs, cameras, VoIP phones, and OT devices.

For related monitoring workflows, see:  
- 📡 [UPS Monitoring Template](ups-monitoring-template.md)  
- 🚀 [Deployment Overview](../docs/deployment-overview.md)  
- 📘 [Runbook](../docs/runbook.md)

For architecture context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)

---

# 🎯 Purpose of This Template

- Standardize SNMP configuration across all device types  
- Ensure secure, sanitized SNMP access  
- Enable consistent telemetry collection  
- Support dashboards, alerting, and automation  
- Reduce configuration drift across sites  

---

# 🔐 1. SNMP Security Configuration

### 🔑 SNMP Version (Sanitized)
| Version | Usage |
|---------|--------|
| **SNMPv2c** | Standard for UPS, cameras, OT devices |
| **SNMPv3** | Optional for enhanced security (sanitized) |

### 🔒 Community Strings (Sanitized)
```
Read-Only:  <SNMP_RO_STRING>
Read-Write: <SNMP_RW_STRING>  (Use only when required)
```

### 🛡️ Access Control
- Restrict SNMP access to monitoring VLAN  
- Block SNMP from Guest, Corporate, and Voice VLANs  
- Allow SNMP only from dashboard collectors  

---

# 📊 2. Standard SNMP OID Categories

### 🧩 Required OID Groups (Sanitized)

| Category | Purpose | Applies To |
|----------|----------|------------|
| **System Info** | Device name, uptime | All devices |
| **Interface Stats** | Port status, errors | Switches, APs, cameras |
| **UPS Metrics** | Runtime, load, battery | UPS devices |
| **Environmental** | Temperature, humidity | UPS, sensors |
| **VoIP Metrics** | SIP status, jitter | VoIP phones |
| **Camera Metrics** | Bitrate, PoE draw | IP cameras |
| **OT Metrics** | Pulse count, alignment | Encoders, SICK lasers |

Related scripts:  
- 📜 `snmp-telemetry-poll.py`  
- 📜 `ups-health-check.ps1`

---

# 🔧 3. SNMP Configuration Template (Fill‑In‑The‑Blanks)

```
Device Name: _______________________
Device Type: _______________________
IP Address: ________________________
VLAN: ______________________________
SNMP Version: ______________________
Read-Only String: _________________
Read-Write String: ________________
Collector IP(s): __________________
Polling Interval: _________________
Alert Threshold Profile: __________
```

---

# 🌐 4. VLAN & Network Requirements

### 🧩 VLAN Assignment

| Device Type | VLAN | Purpose |
|-------------|-------|----------|
| **UPS** | Monitoring VLAN | Telemetry isolation |
| **Switches/APs** | Management VLAN | Network control |
| **Cameras** | Camera VLAN | Surveillance isolation |
| **VoIP Phones** | Voice VLAN | SIP traffic |
| **OT Devices** | OT VLAN | Industrial segmentation |

### 🔧 Switch Port Requirements
- SNMP enabled  
- LLDP enabled  
- Correct VLAN assignment  
- PoE validated (for cameras, APs, VoIP)  

---

# 🚨 5. Alert Threshold Mapping

### ⚠️ Standardized Thresholds (Sanitized)

| Metric | Warning | Critical | Applies To |
|--------|----------|-----------|------------|
| **CPU Utilization** | > 70% | > 85% | Switches, APs |
| **Memory Usage** | > 75% | > 90% | Switches, APs |
| **UPS Runtime** | < 20 min | < 10 min | UPS |
| **UPS Temperature** | > 90°F | > 100°F | UPS |
| **Camera Bitrate** | > 8 Mbps | > 12 Mbps | Cameras |
| **OT Pulse Variance** | > 5% | > 10% | Encoders |

---

# 📁 6. Dashboard Integration Template

### 📊 Required Panels
- Device uptime  
- Interface status  
- CPU/memory utilization  
- UPS runtime/load/battery  
- Camera bitrate & PoE draw  
- OT pulse consistency  
- VoIP SIP registration  

### 🏷️ Dashboard Tags
| Tag | Value |
|------|--------|
| **Site** | `<SITE_NAME>` |
| **Device Type** | `<UPS/SWITCH/AP/CAMERA/OT>` |
| **Location** | `<ZONE>` |
| **VLAN** | `<VLAN_ID>` |

---

# 🧪 7. Validation Checklist

### ✔ Pre‑Monitoring Validation
- Device reachable  
- SNMP responds to test queries  
- VLAN assignment correct  
- Collector can poll OIDs  

### ✔ Post‑Monitoring Validation
- All metrics populate dashboard  
- Alerts trigger correctly  
- Telemetry matches expected values  

---

# 🔐 8. Authentication Workflow (SNMP Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | Device boots | Requests DHCP from assigned VLAN |
| 2 | Switch assigns VLAN | Device placed into correct segment |
| 3 | ACL Enforcement | SNMP restricted to collectors |
| 4 | Collector Polls | OIDs retrieved at set interval |
| 5 | Dashboard Updates | Metrics displayed & alerts triggered |

---

# 🛠️ 9. Infrastructure Engineering Workflow (SNMP Context)

| Phase | Activity | Output |
|-------|----------|--------|
| Assessment | Validate SNMP readiness | SNMP baseline |
| Configuration | Apply SNMP profile | Telemetry enabled |
| Integration | Add device to dashboard | Monitoring visibility |
| Testing | Validate metrics & alerts | SNMP validation report |
| Handoff | Document configuration | Final handoff package |

---

# 🔒 Confidentiality Notice
All SNMP configurations are sanitized for portfolio use.  
No internal UPS SNMP strings, IP ranges, or proprietary monitoring systems are included.
