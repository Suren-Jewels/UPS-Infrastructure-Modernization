# 📶 Wi‑Fi Expansion Guide  
**UPS Facility Modernization — Wireless Infrastructure Upgrade Playbook**

This guide defines the standardized process for expanding and modernizing Wi‑Fi coverage across UPS facilities.  
It ensures consistent RF design, VLAN segmentation, AP placement, and performance validation across all sites.

For architectural context, see:  
- 🗺️ [Network Topology](../architecture/network-topology.md)  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 📊 [Architecture Diagram](../architecture/architecture-diagram.md)

For deployment sequencing, see:  
- 🚀 [Deployment Overview](deployment-overview.md)

---

# 🎯 Objectives of Wi‑Fi Modernization

- Eliminate dead zones in warehouse and logistics areas  
- Improve roaming performance for handheld scanners and mobile devices  
- Standardize SSIDs across all facilities  
- Segment wireless traffic (Corporate, Guest, OT)  
- Ensure AP density supports high‑volume operations  
- Integrate Wi‑Fi telemetry into monitoring dashboards  

---

# 🧭 1. Wi‑Fi Expansion Workflow

| Phase | Activity | Output |
|-------|----------|--------|
| **Assessment** | RF survey, AP count, dead zone identification | RF baseline report |
| **Design** | AP placement, channel plan, VLAN mapping | Wi‑Fi modernization blueprint |
| **Staging** | Pre‑configure APs, SSIDs, VLANs | Deployment kit |
| **Deployment** | Install APs, validate coverage | Updated wireless infrastructure |
| **Testing** | Signal validation, roaming tests | RF validation report |
| **Monitoring** | SNMP/AP telemetry | Wireless health dashboard |

Related docs:  
- 📘 [Runbook](runbook.md)

---

# 📡 2. SSID & VLAN Architecture

### 🧩 Standard SSID Structure
| SSID | Purpose | VLAN |
|------|----------|-------|
| **Corporate** | Laptops, tablets, scanners | Corporate VLAN |
| **Guest** | Visitor access | Guest VLAN |
| **OT Wireless** | Industrial devices | OT VLAN |

### 🔐 Authentication
- Corporate SSID → 802.1X  
- Guest SSID → Captive portal  
- OT SSID → MAC‑based authentication  

Related docs:  
- 🔐 [Authentication Workflow](deployment-overview.md)

---

# 📶 3. AP Placement & RF Design

### 🗺️ RF Design Principles
- APs placed at **30–40 ft spacing** in warehouse aisles  
- Avoid mounting APs directly above metal conveyor systems  
- Use directional antennas for long aisles  
- Ensure overlapping coverage for seamless roaming  

### 📡 AP Mounting Guidelines
- Mount APs at **20–25 ft height**  
- Avoid obstructions (HVAC ducts, beams)  
- Use industrial enclosures where required  

### 🔧 Channel Planning
- Use non‑overlapping 5 GHz channels  
- Minimize co‑channel interference  
- Normalize AP transmit power  

Related scripts:  
- 📜 `wifi-coverage-scan.sh`

---

# 🌐 4. Network Integration

### 🔀 Switch Configuration
- Assign AP ports to trunk mode  
- Allow Corporate, Guest, OT VLANs  
- Validate PoE budget for all APs  

### 🔧 DHCP & Routing
- Ensure each SSID maps to correct DHCP scope  
- Validate routing between VLANs (if required)  
- Apply firewall rules to isolate Guest and OT networks  

Related docs:  
- 🌐 [Network Topology](../architecture/network-topology.md)

---

# 🧪 5. Validation Procedures

### 📶 Signal Strength Validation
- Confirm **-65 dBm or better** in operational zones  
- Validate coverage in loading docks, conveyor areas, and offices  

### 🔄 Roaming Validation
- Walk test with handheld scanner  
- Validate seamless roaming between APs  
- Confirm no session drops  

### 📊 Performance Validation
- Test throughput (sanitized benchmark)  
- Validate latency and jitter  
- Confirm SSID segmentation  

---

# 🛠️ 6. Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Dead zones | AP misplacement | Reposition AP, adjust antenna |
| Weak signal | Interference or distance | Adjust channel, increase AP density |
| Roaming issues | AP power imbalance | Normalize transmit power |
| Authentication failures | RADIUS or SSID mismatch | Validate SSID config, check logs |

Related docs:  
- 🛠️ [Troubleshooting Guide](troubleshooting-guide.md)

---

# 🔐 7. Authentication Workflow (Wi‑Fi Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | AP | Device connects and sends authentication request |
| 2 | RADIUS | Validates credentials (Corporate SSID) |
| 3 | VLAN Assignment | Device placed into Corporate, Guest, or OT VLAN |
| 4 | DHCP | IP assigned from correct scope |
| 5 | ACL Enforcement | Firewall rules applied |
| 6 | Monitoring | AP and client added to telemetry dashboard |

---

# 🛠️ 8. Infrastructure Engineering Workflow (Wi‑Fi Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Assessment | RF survey, AP count | RF baseline |
| Design | AP placement, channel plan | Wi‑Fi blueprint |
| Staging | Pre‑configure APs | Deployment kit |
| Deployment | Install APs | Updated Wi‑Fi |
| Testing | Validate signal & roaming | RF validation report |
| Monitoring | Enable AP telemetry | Wireless dashboard |

---

# 📊 9. Metrics Analyzed (Wi‑Fi Specific)

| Category | Metric | Purpose |
|----------|--------|----------|
| **Signal** | RSSI | Ensures coverage quality |
| **Roaming** | Handoff time | Validates seamless mobility |
| **Performance** | Throughput | Confirms AP density |
| **Health** | AP uptime | Detects failures |
| **Interference** | Channel utilization | Prevents congestion |

---

# 🔒 Confidentiality Notice
All wireless modernization procedures are sanitized for portfolio use.  
No internal UPS RF maps, SSID names, or proprietary configurations are included.
