# 📘 Runbook  
**UPS Infrastructure Modernization — Operational Execution Guide**

This runbook provides the standardized operational procedures used during multi‑site UPS, network, Wi‑Fi, VoIP, camera, and OT modernization.  
It is designed for field engineers, network engineers, OT technicians, and support teams executing on‑site tasks.

For architectural context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 📝 [Architecture Summary](../architecture/architecture-summary.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)  
- 📊 [Architecture Diagram](../architecture/architecture-diagram.md)

For deployment sequencing, see:  
- 🚀 [Deployment Overview](deployment-overview.md)

---

# 🧭 Runbook Structure

This runbook is organized into the following operational domains:

1. 🔌 UPS Modernization  
2. 🌐 Network & Wi‑Fi Upgrade  
3. ☎️ VoIP Migration  
4. 🎥 Camera Integration  
5. 🏭 OT System Validation  
6. 🖥️ Device Provisioning  
7. 📡 Monitoring & Telemetry  
8. 🛠️ Incident Response (Field Level)

---

# 🔌 1. UPS Modernization Procedures

### 🔧 Pre‑Installation
- Verify bypass panel readiness  
- Confirm UPS model and battery type  
- Validate SNMP card compatibility  
- Review electrical load requirements  

### ⚡ Installation Steps
1. Power down connected equipment (if required)  
2. Install UPS hardware and battery modules  
3. Connect SNMP card to network  
4. Validate runtime and load baselines  
5. Enable environmental sensors  

### 📡 Post‑Installation
- Confirm SNMP telemetry  
- Validate alert thresholds  
- Document serial numbers and installation details  

Related docs:  
- ⚡ [UPS Modernization Playbook](ups-modernization-playbook.md)

---

# 🌐 2. Network & Wi‑Fi Upgrade Procedures

### 🔧 Switch Deployment
- Install Meraki switches  
- Apply VLAN templates  
- Configure trunk/access ports  
- Validate PoE budget  

### 📶 Wi‑Fi Expansion
- Deploy APs per RF design  
- Validate signal strength  
- Confirm SSID segmentation  
- Test roaming in warehouse zones  

Related docs:  
- 📶 [Wi‑Fi Expansion Guide](wifi-expansion-guide.md)

---

# ☎️ 3. VoIP Migration Procedures

### 🔧 Pre‑Migration
- Identify PBX endpoints  
- Validate SIP gateway configuration  
- Confirm QoS policies  

### 🔄 Migration Steps
1. Move endpoints to Voice VLAN  
2. Register devices to SIP server  
3. Validate call quality (MOS score)  
4. Test internal and external calling  

Related docs:  
- ☎️ [VoIP Migration Guide](voip-migration-guide.md)

---

# 🎥 4. Camera Integration Procedures

### 🔧 Installation
- Mount IP cameras  
- Connect to PoE switch  
- Assign Camera VLAN  

### 📼 NVR Configuration
- Add camera streams  
- Validate bitrate and retention  
- Confirm motion detection (if applicable)  

Related docs:  
- 🎥 [Camera Support Runbook](camera-support-runbook.md)

---

# 🏭 5. OT System Validation Procedures

### 🔧 SICK Laser Validation
- Check alignment  
- Validate detection zones  
- Confirm telemetry  

### 📏 Encoder Validation
- Verify pulse accuracy  
- Confirm conveyor synchronization  

Related docs:  
- 🏭 [SICK Laser Maintenance](sick-laser-maintenance.md)  
- 📏 [Encoder Support Guide](encoder-support-guide.md)

---

# 🖥️ 6. Device Provisioning Procedures

### 🧰 Windows (Intune)
- Enroll device  
- Apply baseline policies  
- Validate compliance  

### 🍎 macOS (Jamf)
- Enroll device  
- Apply configuration profiles  
- Validate security posture  

Related docs:  
- 🖥️ [Remote Support Procedures](remote-support-procedures.md)

---

# 📡 7. Monitoring & Telemetry Procedures

### 🔧 SNMP Activation
- Add UPS to monitoring dashboard  
- Validate runtime, load, battery health  
- Confirm environmental sensor data  

### 📊 Network Telemetry
- Monitor switch port utilization  
- Validate AP health  
- Review VLAN traffic patterns  

Related scripts:  
- 📜 `ups-health-check.ps1`  
- 📜 `snmp-telemetry-poll.py`

---

# 🛠️ 8. Incident Response (Field Level)

### ⚠️ Common Scenarios
| Issue | Action |
|-------|--------|
| UPS not reporting SNMP | Check network port, VLAN, SNMP card status |
| AP offline | Validate PoE, switch port, RF interference |
| VoIP call drops | Check QoS, VLAN tagging, packet loss |
| Camera not streaming | Validate PoE, NVR registration, bitrate |
| OT device offline | Check OT VLAN, cabling, device power |

Related docs:  
- 🛠️ [Troubleshooting Guide](troubleshooting-guide.md)

---

# 🔒 Confidentiality Notice
All procedures are sanitized for portfolio use.  
No internal UPS configurations, IP ranges, or proprietary workflows are included.
