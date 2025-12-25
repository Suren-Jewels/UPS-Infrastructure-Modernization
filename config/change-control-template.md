# 📝 Change Control Template  
**Standardized Change Management Workflow for UPS Facility Modernization**

This template defines the standardized change‑control process used across all UPS modernization activities.  
It ensures consistent documentation, risk assessment, approval workflows, rollback planning, and post‑implementation validation.

For related workflows, see:  
- 🚀 [Deployment Overview](../docs/deployment-overview.md)  
- 📘 [Runbook](../docs/runbook.md)  
- 🛠️ [Troubleshooting Guide](../docs/troubleshooting-guide.md)

For architecture context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)

---

# 🎯 Purpose of This Template

- Standardize change documentation across all UPS facilities  
- Ensure safe execution of network, UPS, Wi‑Fi, VoIP, camera, OT, and provisioning changes  
- Reduce risk through structured approvals and rollback plans  
- Maintain auditability and operational consistency  
- Support engineering, field, and leadership visibility  

---

# 🧩 1. Change Summary

```
Change Title: ________________________________
Change Type:  (Standard / Emergency / Major)
Requested By: ________________________________
Date Submitted: ______________________________
Target Implementation Date: __________________
Affected Site(s): ____________________________
Affected System(s): __________________________
```

---

# 🛠️ 2. Change Description

### 📄 Detailed Description
```
Provide a clear, concise description of the change:
____________________________________________________
____________________________________________________
____________________________________________________
```

### 🔧 Components Involved
- UPS  
- Network  
- Wi‑Fi  
- VoIP  
- Cameras  
- OT (SICK lasers, encoders)  
- Device provisioning  
- Monitoring systems  

(Select all that apply.)

---

# ⚙️ 3. Technical Plan

### 🧰 Implementation Steps
```
1. ________________________________________________
2. ________________________________________________
3. ________________________________________________
4. ________________________________________________
```

### 🧪 Pre‑Change Validation
- Device reachable  
- SNMP telemetry active  
- VLAN assignment correct  
- Baseline metrics captured  

### 📦 Required Files/Configs
- SNMP profile  
- VLAN templates  
- QoS templates  
- Wi‑Fi baseline  
- OT configuration  
- UPS monitoring template  

---

# ⚠️ 4. Risk Assessment

### 🔍 Risk Level
| Level | Description |
|--------|-------------|
| **Low** | Minimal impact, easy rollback |
| **Medium** | Potential service disruption |
| **High** | Critical systems affected |

### 🧨 Risk Description
```
Describe potential risks:
____________________________________________________
____________________________________________________
```

### 🛡️ Mitigation Steps
```
1. ________________________________________________
2. ________________________________________________
```

---

# 🔄 5. Rollback Plan

### 🧯 Rollback Steps
```
1. ________________________________________________
2. ________________________________________________
3. ________________________________________________
```

### 🧪 Rollback Validation
- Device reachable  
- Services restored  
- Telemetry restored  
- No new alerts  

---

# 👥 6. Approval Workflow

### 🧩 Required Approvals
| Role | Name | Status |
|------|-------|---------|
| Field Engineer | __________ | Approved / Pending |
| Network/OT Engineer | __________ | Approved / Pending |
| Site Leadership | __________ | Approved / Pending |
| Change Manager | __________ | Approved / Pending |

---

# 🚀 7. Implementation Log

### 📝 Execution Notes
```
Start Time: _______________________
End Time:   _______________________

Notes:
____________________________________________________
____________________________________________________
```

### 🧪 Post‑Change Validation
- SNMP telemetry validated  
- VLAN routing validated  
- UPS runtime/load validated  
- Wi‑Fi roaming validated  
- VoIP call quality validated  
- Camera streams validated  
- OT pulse/alignment validated  

---

# 📊 8. Metrics to Monitor After Change

| Category | Metric | Purpose |
|----------|--------|----------|
| **Network** | Latency, jitter | Detect instability |
| **UPS** | Runtime, load | Validate power stability |
| **Wi‑Fi** | RSSI, roaming | Confirm wireless performance |
| **VoIP** | MOS score | Validate call quality |
| **Cameras** | Bitrate, PoE draw | Confirm surveillance health |
| **OT** | Pulse consistency | Validate conveyor accuracy |

---

# 🗂️ 9. Final Documentation

### 📄 Required Attachments
- Before/after screenshots  
- Logs  
- Config files  
- Validation results  
- Approval records  

### 🏁 Change Status
| Status | Description |
|--------|-------------|
| **Completed** | Change executed successfully |
| **Rolled Back** | Change reverted |
| **Deferred** | Change postponed |

---

# 🔒 Confidentiality Notice
All change‑control procedures are sanitized for portfolio use.  
No internal UPS systems, credentials, or proprietary workflows are included.
