# 🎥 Camera VLAN Template  
**Standardized VLAN & Network Configuration for IP Cameras in UPS Facilities**

This template defines the standardized VLAN, switch, firewall, and network configuration for IP cameras across all modernized UPS facilities.  
It ensures consistent segmentation, PoE stability, NVR connectivity, and monitoring integration.

For related workflows, see:  
- 🎥 [Camera Support Runbook](../docs/camera-support-runbook.md)  
- 🚀 [Deployment Overview](../docs/deployment-overview.md)  
- 📘 [Runbook](../docs/runbook.md)

For architecture context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)

---

# 🎯 Purpose of This Template

- Standardize camera VLAN configuration across all UPS facilities  
- Ensure consistent isolation of surveillance traffic  
- Support PoE‑powered IP cameras and NVR systems  
- Improve reliability and reduce troubleshooting time  
- Enable unified monitoring and telemetry  

---

# 🧩 1. Camera VLAN Definition

### 📡 VLAN Structure (Sanitized)

| Component | VLAN | Purpose |
|-----------|-------|----------|
| **IP Cameras** | `<CAMERA_VLAN>` | Isolated surveillance traffic |
| **NVR Systems** | `<CAMERA_VLAN>` | Centralized recording |
| **Monitoring Collector** | `<CAMERA_VLAN>` | Telemetry polling |

### 🔧 VLAN Requirements
- Layer‑2 isolation from Corporate, Guest, Voice, and OT VLANs  
- Layer‑3 access only to NVR and monitoring systems  
- DHCP scope dedicated to camera devices  

---

# 🔌 2. Switch Port Configuration

### 🧰 Access Port Template
```
switchport mode access
switchport access vlan <CAMERA_VLAN>
power inline auto
spanning-tree portfast
```

### 🔀 Trunk Port Requirements
- Allow `<CAMERA_VLAN>`  
- Allow Management VLAN (for switch control)  
- Block Guest VLAN  

### 🔋 PoE Requirements
- Validate PoE budget before deployment  
- Ensure cameras receive required wattage  
- Monitor PoE draw via SNMP  

Related docs:  
- 🎥 [Camera Support Runbook](../docs/camera-support-runbook.md)

---

# 🔐 3. Firewall & ACL Requirements

### 🚫 Blocked Traffic
| Source | Destination | Action |
|--------|-------------|--------|
| Camera VLAN | Corporate VLAN | Block |
| Camera VLAN | Guest VLAN | Block |
| Camera VLAN | OT VLAN | Block |

### ✅ Allowed Traffic
| Source | Destination | Purpose |
|--------|-------------|----------|
| Camera VLAN | NVR | Video streaming |
| Camera VLAN | Monitoring Collector | Telemetry |
| NVR | Camera VLAN | Stream registration |

### 🔒 Security Notes
- Cameras must not reach the internet  
- NVR access restricted to authorized systems  
- No lateral movement allowed between cameras  

---

# 📼 4. NVR Integration Template

### 🧩 Required Settings
- Static IP for NVR  
- Add camera streams via RTSP/ONVIF  
- Validate retention (sanitized)  
- Confirm recording schedule  

### 📊 NVR Health Metrics
- Storage utilization  
- Recording uptime  
- Stream registration status  
- Bitrate per camera  

---

# 📡 5. Monitoring & Telemetry Baseline

### 📊 Required Metrics
- Camera uptime  
- PoE draw  
- Bitrate  
- Packet loss  
- NVR recording status  

### 🧪 Validation Tests
- Confirm camera reachable  
- Validate stream registration  
- Test playback  
- Validate retention window  

Related scripts:  
- 📜 `snmp-telemetry-poll.py`

---

# 🔧 6. Configuration Template (Fill‑In‑The‑Blanks)

```
Site Name: ___________________________
Camera VLAN: _________________________
NVR IP Address: ______________________
DHCP Scope: __________________________
Switch Model: ________________________
PoE Budget: __________________________
Camera Count: ________________________
Firewall Rule Set: ___________________
Validation Date: _____________________
Engineer: ____________________________
```

---

# 🔐 7. Authentication Workflow (Camera VLAN Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | Camera boots | Requests DHCP from Camera VLAN |
| 2 | Switch assigns VLAN | Camera placed into Camera VLAN |
| 3 | DHCP | IP assigned from Camera scope |
| 4 | NVR Registration | Camera added to NVR |
| 5 | ACL Enforcement | Camera restricted to NVR only |
| 6 | Monitoring | Camera added to telemetry dashboard |

---

# 🛠️ 8. Infrastructure Engineering Workflow (Camera VLAN Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Assessment | Identify coverage gaps | Camera baseline |
| Design | Define placement, VLAN, retention | Surveillance blueprint |
| Staging | Pre‑configure cameras | Deployment kit |
| Deployment | Install cameras | Updated surveillance infra |
| Testing | Validate streams & retention | Camera validation report |
| Monitoring | Enable telemetry | Camera dashboard |

---

# 📊 9. Metrics Analyzed (Camera VLAN Specific)

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
All camera VLAN configurations are sanitized for portfolio use.  
No internal UPS camera models, NVR configurations, or proprietary retention policies are included.
