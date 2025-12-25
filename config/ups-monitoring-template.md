# 📡 UPS Monitoring Template  
**Standardized SNMP & Telemetry Configuration for UPS Modernization**

This template defines the standardized monitoring configuration for UPS systems across all modernized UPS facilities.  
It ensures consistent SNMP telemetry, alert thresholds, environmental monitoring, and dashboard integration.

For related operational workflows, see:  
- ⚡ [UPS Modernization Playbook](../docs/ups-modernization-playbook.md)  
- 🚀 [Deployment Overview](../docs/deployment-overview.md)  
- 📘 [Runbook](../docs/runbook.md)

For architecture context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)

---

# 🎯 Purpose of This Template

- Standardize UPS telemetry across all sites  
- Ensure consistent alerting thresholds  
- Enable proactive maintenance  
- Integrate UPS metrics into dashboards  
- Support SNMP‑based automation and health checks  

---

# 🔌 1. UPS Telemetry Configuration

### 📊 Required SNMP OIDs (Sanitized)

| Category | OID | Description |
|----------|------|-------------|
| **Runtime** | `1.3.x.x.x` | Remaining runtime (minutes) |
| **Load** | `1.3.x.x.x` | Current load percentage |
| **Battery Health** | `1.3.x.x.x` | Battery condition status |
| **Temperature** | `1.3.x.x.x` | Internal UPS temperature |
| **Input Voltage** | `1.3.x.x.x` | Incoming power voltage |
| **Output Voltage** | `1.3.x.x.x` | UPS output voltage |
| **Bypass Status** | `1.3.x.x.x` | Indicates if UPS is in bypass mode |

Related scripts:  
- 📜 `ups-health-check.ps1`  
- 📜 `snmp-telemetry-poll.py`

---

# 🚨 2. Alert Thresholds (Standardized)

### ⚠️ Recommended Thresholds (Sanitized)

| Metric | Warning | Critical | Notes |
|--------|----------|-----------|--------|
| **Runtime** | < 20 min | < 10 min | Based on facility load |
| **Load** | > 70% | > 85% | Prevent overload |
| **Temperature** | > 90°F | > 100°F | Ensure ventilation |
| **Battery Health** | Degraded | Failed | Trigger replacement |
| **Input Voltage** | ±10% | ±15% | Indicates power issues |

---

# 🌐 3. Network & VLAN Requirements

### 🧩 VLAN Assignment

| Component | VLAN | Purpose |
|-----------|-------|----------|
| **UPS SNMP Card** | Monitoring VLAN | Telemetry isolation |
| **Environmental Sensors** | Monitoring VLAN | Unified monitoring |
| **Dashboard Collector** | Monitoring VLAN | SNMP polling |

### 🔧 Switch Port Configuration
- Access port  
- Monitoring VLAN  
- SNMP enabled  
- LLDP enabled  

Related docs:  
- 🌐 [Network Topology](../architecture/network-topology.md)

---

# 📁 4. Dashboard Integration Template

### 📊 Required Dashboard Panels
- Runtime (minutes)  
- Load (%)  
- Battery health  
- Temperature  
- Input/output voltage  
- Environmental sensor readings  
- UPS status (online/on battery/bypass)  

### 🔧 Dashboard Tags
| Tag | Value |
|------|--------|
| **Site** | `<SITE_NAME>` |
| **UPS Model** | `<MODEL>` |
| **Location** | `<LOCATION>` |
| **Rack/Zone** | `<ZONE>` |

---

# 🧪 5. Validation Checklist

### ✔ Pre‑Monitoring Validation
- UPS reachable via ping  
- SNMP responds to test queries  
- VLAN assignment correct  
- Dashboard collector can poll OIDs  

### ✔ Post‑Monitoring Validation
- All metrics populate dashboard  
- Alerts trigger correctly  
- Environmental sensors reporting  
- Runtime and load values accurate  

---

# 📝 6. Configuration Template (Fill‑In‑The‑Blanks)

```
UPS Name: _______________________
Site: ___________________________
Model: __________________________
IP Address: _____________________
VLAN: ___________________________
SNMP Community: _________________
Dashboard Group: ________________
Alert Recipients: _______________
```

---

# 🔐 7. Authentication Workflow (UPS Monitoring Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | SNMP Card | Requests DHCP from Monitoring VLAN |
| 2 | Switch | Assigns Monitoring VLAN |
| 3 | DHCP | IP assigned from monitoring scope |
| 4 | ACL | Restricts UPS to monitoring systems |
| 5 | Collector | Polls OIDs for telemetry |
| 6 | Dashboard | Displays metrics & alerts |

---

# 🛠️ 8. Infrastructure Engineering Workflow (Monitoring Context)

| Phase | Activity | Output |
|-------|----------|--------|
| Assessment | Validate UPS readiness | Monitoring baseline |
| Configuration | Apply SNMP profile | Telemetry enabled |
| Integration | Add UPS to dashboard | Monitoring visibility |
| Testing | Validate metrics & alerts | Monitoring report |
| Handoff | Document configuration | Final handoff package |

---

# 🔒 Confidentiality Notice
All monitoring configurations are sanitized for portfolio use.  
No internal UPS SNMP strings, IP ranges, or proprietary monitoring systems are included.
