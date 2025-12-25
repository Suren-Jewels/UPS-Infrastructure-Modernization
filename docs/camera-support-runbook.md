# 🎥 Camera Support Runbook  
**UPS Facility Modernization — IP Camera & NVR Operational Guide**

This runbook provides standardized procedures for installing, configuring, validating, and supporting IP cameras and NVR systems across UPS facilities.  
It ensures consistent VLAN segmentation, PoE provisioning, retention validation, and monitoring integration.

For architectural context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)  
- 📊 [Architecture Diagram](../architecture/architecture-diagram.md)

For deployment sequencing, see:  
- 🚀 [Deployment Overview](deployment-overview.md)

---

# 🎯 Objectives of Camera Modernization

- Standardize IP camera deployment across all UPS facilities  
- Improve surveillance coverage in logistics, warehouse, and dock areas  
- Ensure PoE stability and VLAN isolation  
- Integrate camera telemetry into monitoring dashboards  
- Validate NVR retention and stream quality  
- Reduce troubleshooting time with consistent workflows  

---

# 🧭 1. Camera Deployment Workflow

| Phase | Activity | Output |
|-------|----------|--------|
| **Assessment** | Identify coverage gaps, validate PoE capacity | Camera baseline report |
| **Design** | Define camera placement, VLAN, retention | Surveillance blueprint |
| **Staging** | Pre‑configure cameras, assign IPs | Deployment kit |
| **Deployment** | Install cameras, connect to PoE | Updated surveillance infrastructure |
| **Testing** | Validate stream quality, retention | Camera validation report |
| **Monitoring** | Enable telemetry | Camera health dashboard |

Related docs:  
- 📘 [Runbook](runbook.md)

---

# 📸 2. Camera Placement & Coverage Design

### 🗺️ Placement Principles
- Cover conveyor belts, loading docks, and high‑traffic zones  
- Avoid pointing cameras directly at bright light sources  
- Use wide‑angle lenses for large warehouse areas  
- Use narrow FOV lenses for aisles or choke points  

### 🔧 Mounting Guidelines
- Mount cameras at **12–20 ft height**  
- Avoid obstructions (beams, HVAC ducts)  
- Use weather‑rated housings for dock doors  

---

# 🔀 3. Network & VLAN Integration

### 🧩 VLAN Structure
| VLAN | Purpose |
|------|---------|
| **Camera VLAN** | IP cameras, NVR systems |
| **Corporate VLAN** | PCs, servers |
| **Voice VLAN** | VoIP phones |
| **OT VLAN** | Industrial devices |

### 🔧 Switch Configuration
- Assign camera ports to **Camera VLAN**  
- Validate PoE budget for all cameras  
- Confirm trunk ports allow Camera VLAN  

### 🔐 Firewall Rules
- Allow camera → NVR traffic  
- Block camera → Corporate traffic  
- Restrict NVR access to authorized systems  

Related docs:  
- 🌐 [Network Topology](../architecture/network-topology.md)

---

# 📼 4. NVR Configuration

### 🧰 Pre‑Configuration
- Assign static IP to NVR  
- Configure storage retention (sanitized)  
- Add camera streams via RTSP/ONVIF  
- Validate recording schedule  

### 📊 Retention Validation
- Confirm retention meets UPS standards  
- Validate storage utilization  
- Test playback for multiple days  

---

# 🧪 5. Camera Validation Procedures

### 🎥 Stream Validation
- Confirm live video feed  
- Validate bitrate and resolution  
- Test night mode / IR functionality  

### 🔄 Motion & Event Validation
- Validate motion detection (if applicable)  
- Confirm event logging in NVR  

### 📡 Network Validation
- Confirm camera reachable via ping  
- Validate VLAN assignment  
- Check PoE draw  

---

# 🛠️ 6. Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Camera offline | PoE issue or VLAN mismatch | Validate PoE, confirm Camera VLAN |
| No video stream | NVR registration failure | Re-add camera, validate RTSP stream |
| Choppy video | High bitrate or congestion | Lower bitrate, check switch utilization |
| IR not working | Hardware fault | Inspect IR LEDs, replace camera |

Related docs:  
- 🛠️ [Troubleshooting Guide](troubleshooting-guide.md)

---

# 🔐 7. Authentication Workflow (Camera Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | Camera boots | Requests DHCP from Camera VLAN |
| 2 | Switch assigns VLAN | Camera placed into Camera VLAN |
| 3 | DHCP | Camera receives IP from Camera scope |
| 4 | NVR Registration | Camera added to NVR |
| 5 | ACL Enforcement | Camera restricted to NVR only |
| 6 | Monitoring | Camera added to telemetry dashboard |

---

# 🛠️ 8. Infrastructure Engineering Workflow (Camera Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Assessment | Identify coverage gaps | Camera baseline |
| Design | Define placement, VLAN, retention | Surveillance blueprint |
| Staging | Pre‑configure cameras | Deployment kit |
| Deployment | Install cameras | Updated surveillance infra |
| Testing | Validate streams & retention | Camera validation report |
| Monitoring | Enable telemetry | Camera dashboard |

---

# 📊 9. Metrics Analyzed (Camera Specific)

| Category | Metric | Purpose |
|----------|--------|----------|
| **Video** | Bitrate | Ensures storage capacity |
| | Resolution | Validates clarity |
| **Network** | PoE draw | Confirms switch power budget |
| | Packet loss | Prevents video drops |
| **NVR** | Storage utilization | Ensures retention compliance |
| | Recording uptime | Detects failures |

---

# 🔒 Confidentiality Notice
All camera modernization procedures are sanitized for portfolio use.  
No internal UPS camera models, NVR configurations, or proprietary retention policies are included.
