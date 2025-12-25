# 🏭 SICK Laser Maintenance Guide  
**UPS Facility Modernization — Industrial Scanner Alignment & Support Procedures**

This guide provides standardized procedures for maintaining, aligning, validating, and troubleshooting SICK industrial laser scanners used across UPS conveyor and logistics systems.  
It ensures consistent OT performance, accurate detection, and reliable telemetry across all modernized facilities.

For architectural context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)

For related OT systems, see:  
- 📏 [Encoder Support Guide](encoder-support-guide.md)

---

# 🎯 Purpose of SICK Laser Modernization

- Improve conveyor alignment accuracy  
- Reduce false positives and missed reads  
- Standardize OT VLAN segmentation  
- Ensure consistent telemetry for monitoring  
- Reduce downtime caused by misalignment or sensor drift  
- Provide field engineers with a repeatable maintenance workflow  

---

# 🧭 1. SICK Laser Maintenance Workflow

| Phase | Activity | Output |
|-------|----------|--------|
| **Assessment** | Inspect mounting, wiring, alignment | OT baseline report |
| **Cleaning** | Remove dust, debris, obstructions | Clean optical surface |
| **Alignment** | Adjust angle, height, detection zone | Calibrated laser |
| **Validation** | Test detection accuracy | Alignment validation report |
| **Monitoring** | Enable OT telemetry | OT health dashboard |

Related docs:  
- 📘 [Runbook](runbook.md)

---

# 🔧 2. Physical Inspection Procedures

### 🏗️ Mounting Inspection
- Verify laser is securely mounted  
- Inspect for vibration or loose brackets  
- Ensure no conveyor components obstruct the beam  

### 🔌 Wiring & Connectivity
- Validate power connection  
- Confirm OT VLAN port assignment  
- Inspect cable strain relief and routing  

### 🧼 Optical Surface Cleaning
- Use lint‑free cloth  
- Avoid abrasive cleaners  
- Ensure lens is free of dust and smudges  

---

# 📐 3. Alignment Procedures

### 🎯 Alignment Principles
- Laser must be perpendicular to conveyor path  
- Detection zone must fully cover package width  
- Avoid reflective surfaces that cause false readings  

### 🔧 Alignment Steps
1. Enter alignment mode (sanitized procedure)  
2. Adjust vertical angle until detection zone is centered  
3. Adjust horizontal angle for full conveyor coverage  
4. Validate detection using test packages  
5. Save alignment profile  

### 🧪 Validation Tests
- Test small, medium, and large packages  
- Validate detection at conveyor edges  
- Confirm no false triggers  

---

# 🌐 4. Network & OT Integration

### 🧩 VLAN Structure
| VLAN | Purpose |
|------|---------|
| **OT VLAN** | SICK lasers, encoders, industrial sensors |
| **Corporate VLAN** | PCs, servers |
| **Camera VLAN** | IP cameras |
| **Voice VLAN** | VoIP phones |

### 🔧 Switch Configuration
- Assign laser ports to **OT VLAN**  
- Validate link speed and duplex  
- Confirm no unauthorized traffic  

### 🔐 Firewall Rules
- Allow laser → OT controller traffic  
- Block OT → Corporate traffic  
- Restrict access to authorized monitoring systems  

Related docs:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)

---

# 📡 5. Telemetry & Monitoring

### 📊 Metrics Collected
- Alignment status  
- Detection accuracy  
- Error codes  
- Temperature (if supported)  
- Uptime  

### 🧪 Telemetry Validation
- Confirm laser appears in OT dashboard  
- Validate real‑time detection events  
- Trigger test alerts  

Related scripts:  
- 📜 `snmp-telemetry-poll.py`

---

# 🛠️ 6. Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Missed detections | Misalignment or dirty lens | Realign laser, clean optical surface |
| False triggers | Reflective surfaces | Adjust angle, add shielding |
| Laser offline | OT VLAN issue or power loss | Validate VLAN, inspect cabling |
| Intermittent readings | Vibration or loose mount | Tighten brackets, inspect conveyor |

Related docs:  
- 🛠️ [Troubleshooting Guide](troubleshooting-guide.md)

---

# 🔐 7. Authentication Workflow (OT Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | Laser boots | Requests DHCP from OT VLAN |
| 2 | Switch assigns VLAN | Laser placed into OT VLAN |
| 3 | DHCP | IP assigned from OT scope |
| 4 | OT Controller Registration | Laser added to OT system |
| 5 | ACL Enforcement | Laser restricted to OT traffic only |
| 6 | Monitoring | Laser added to OT dashboard |

---

# 🛠️ 8. Infrastructure Engineering Workflow (OT Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Assessment | Inspect alignment, wiring | OT baseline |
| Cleaning | Clean optical surface | Clear lens |
| Alignment | Adjust angle & detection zone | Calibrated laser |
| Validation | Test detection accuracy | Alignment report |
| Monitoring | Enable telemetry | OT dashboard |

---

# 📊 9. Metrics Analyzed (SICK Laser Specific)

| Category | Metric | Purpose |
|----------|--------|----------|
| **Alignment** | Beam angle | Ensures accurate detection |
| **Performance** | Detection accuracy | Validates conveyor coverage |
| **Health** | Error codes | Detects hardware issues |
| **Network** | OT VLAN connectivity | Confirms segmentation |
| **Telemetry** | Event frequency | Detects anomalies |

---

# 🔒 Confidentiality Notice
All SICK laser procedures are sanitized for portfolio use.  
No internal UPS OT configurations, proprietary alignment tools, or vendor‑specific calibration details are included.
