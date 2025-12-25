# 📏 Encoder Support Guide  
**UPS Facility Modernization — Conveyor Encoder Maintenance & Diagnostics**

This guide provides standardized procedures for maintaining, calibrating, validating, and troubleshooting conveyor encoders used across UPS logistics systems.  
Encoders are critical OT components that ensure accurate conveyor movement, package tracking, and synchronization with SICK lasers and other industrial sensors.

For architectural context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)

For related OT systems, see:  
- 🏭 [SICK Laser Maintenance](sick-laser-maintenance.md)

---

# 🎯 Purpose of Encoder Modernization

- Improve conveyor synchronization accuracy  
- Reduce misreads and tracking errors  
- Standardize OT VLAN segmentation  
- Ensure consistent telemetry and diagnostics  
- Reduce downtime caused by mechanical wear or misalignment  
- Provide field engineers with a repeatable maintenance workflow  

---

# 🧭 1. Encoder Maintenance Workflow

| Phase | Activity | Output |
|-------|----------|--------|
| **Assessment** | Inspect mounting, wiring, belt tension | OT baseline report |
| **Cleaning** | Remove debris from encoder wheel | Clean encoder surface |
| **Calibration** | Adjust pulse count, wheel pressure | Calibrated encoder |
| **Validation** | Test pulse accuracy | Encoder validation report |
| **Monitoring** | Enable OT telemetry | OT health dashboard |

Related docs:  
- 📘 [Runbook](runbook.md)

---

# 🔧 2. Physical Inspection Procedures

### 🏗️ Mounting Inspection
- Verify encoder is securely mounted  
- Inspect for vibration or loose brackets  
- Ensure encoder wheel maintains consistent contact with conveyor belt  

### 🔌 Wiring & Connectivity
- Validate power connection  
- Confirm OT VLAN port assignment  
- Inspect cable routing and strain relief  

### 🧼 Encoder Wheel Cleaning
- Remove dust, grease, or debris  
- Ensure wheel rotates freely  
- Avoid solvents that degrade rubber  

---

# 📐 3. Calibration Procedures

### 🎯 Calibration Principles
- Encoder wheel must maintain constant pressure on conveyor  
- Pulse count must match conveyor speed specifications  
- Avoid slippage, which causes inaccurate readings  

### 🔧 Calibration Steps
1. Enter calibration mode (sanitized procedure)  
2. Adjust encoder wheel pressure  
3. Validate pulse count per conveyor rotation  
4. Test with slow, medium, and fast conveyor speeds  
5. Save calibration profile  

### 🧪 Validation Tests
- Confirm pulse consistency  
- Validate synchronization with SICK laser  
- Test conveyor start/stop behavior  

Related docs:  
- 🏭 [SICK Laser Maintenance](sick-laser-maintenance.md)

---

# 🌐 4. Network & OT Integration

### 🧩 VLAN Structure
| VLAN | Purpose |
|------|---------|
| **OT VLAN** | Encoders, SICK lasers, industrial sensors |
| **Corporate VLAN** | PCs, servers |
| **Camera VLAN** | IP cameras |
| **Voice VLAN** | VoIP phones |

### 🔧 Switch Configuration
- Assign encoder ports to **OT VLAN**  
- Validate link speed and duplex  
- Confirm no unauthorized traffic  

### 🔐 Firewall Rules
- Allow encoder → OT controller traffic  
- Block OT → Corporate traffic  
- Restrict access to authorized monitoring systems  

Related docs:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)

---

# 📡 5. Telemetry & Monitoring

### 📊 Metrics Collected
- Pulse count  
- Pulse consistency  
- Error codes  
- Uptime  
- Conveyor synchronization status  

### 🧪 Telemetry Validation
- Confirm encoder appears in OT dashboard  
- Validate real‑time pulse events  
- Trigger test alerts  

Related scripts:  
- 📜 `snmp-telemetry-poll.py`

---

# 🛠️ 6. Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Pulse drops | Slippage or worn wheel | Adjust pressure, replace wheel |
| Inconsistent readings | Vibration or loose mount | Tighten brackets, inspect conveyor |
| Encoder offline | OT VLAN issue or power loss | Validate VLAN, inspect cabling |
| Conveyor desync | Incorrect pulse count | Recalibrate encoder |

Related docs:  
- 🛠️ [Troubleshooting Guide](troubleshooting-guide.md)

---

# 🔐 7. Authentication Workflow (OT Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | Encoder boots | Requests DHCP from OT VLAN |
| 2 | Switch assigns VLAN | Encoder placed into OT VLAN |
| 3 | DHCP | IP assigned from OT scope |
| 4 | OT Controller Registration | Encoder added to OT system |
| 5 | ACL Enforcement | Encoder restricted to OT traffic only |
| 6 | Monitoring | Encoder added to OT dashboard |

---

# 🛠️ 8. Infrastructure Engineering Workflow (Encoder Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Assessment | Inspect wheel, wiring, belt tension | OT baseline |
| Cleaning | Clean encoder wheel | Clear rotation |
| Calibration | Adjust pulse count | Calibrated encoder |
| Validation | Test pulse accuracy | Encoder validation report |
| Monitoring | Enable telemetry | OT dashboard |

---

# 📊 9. Metrics Analyzed (Encoder Specific)

| Category | Metric | Purpose |
|----------|--------|----------|
| **Performance** | Pulse count | Ensures conveyor accuracy |
| | Pulse consistency | Detects slippage |
| **Health** | Error codes | Identifies hardware issues |
| **Network** | OT VLAN connectivity | Confirms segmentation |
| **Telemetry** | Event frequency | Detects anomalies |

---

# 🔒 Confidentiality Notice
All encoder procedures are sanitized for portfolio use.  
No internal UPS OT configurations, proprietary calibration tools, or vendor‑specific encoder models are included.
