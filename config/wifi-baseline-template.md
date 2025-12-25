# 📶 Wi‑Fi Baseline Template  
**Standardized Wireless Configuration for UPS Facility Modernization**

This template defines the standardized Wi‑Fi configuration applied across all modernized UPS facilities.  
It ensures consistent SSID structure, VLAN mapping, RF design, security posture, and monitoring integration.

For related workflows, see:  
- 📶 [Wi‑Fi Expansion Guide](../docs/wifi-expansion-guide.md)  
- 🚀 [Deployment Overview](../docs/deployment-overview.md)  
- 📘 [Runbook](../docs/runbook.md)

For architecture context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)

---

# 🎯 Purpose of This Template

- Standardize Wi‑Fi configuration across all UPS facilities  
- Ensure consistent SSID naming and VLAN segmentation  
- Improve roaming performance for scanners and mobile devices  
- Support high‑density warehouse environments  
- Enable unified telemetry and monitoring  

---

# 🌐 1. Standard SSID & VLAN Mapping

### 🧩 SSID Structure (Sanitized)

| SSID Name | VLAN | Purpose |
|-----------|-------|----------|
| **Corporate** | `<CORP_VLAN>` | Laptops, tablets, scanners |
| **Guest** | `<GUEST_VLAN>` | Visitor access |
| **OT Wireless** | `<OT_VLAN>` | Industrial devices |

### 🔐 Authentication Requirements

| SSID | Authentication | Notes |
|------|----------------|--------|
| **Corporate** | 802.1X | Secure access for employees |
| **Guest** | Captive Portal | Internet‑only access |
| **OT Wireless** | MAC‑based | Industrial device compatibility |

---

# 📡 2. RF Design Baseline

### 📶 AP Placement Guidelines
- 30–40 ft spacing in warehouse aisles  
- Avoid mounting directly above conveyors  
- Use directional antennas for long aisles  
- Ensure overlapping coverage for roaming  

### 📡 Transmit Power Baseline
| Band | Power Level | Notes |
|------|--------------|--------|
| **2.4 GHz** | Medium | Avoid oversaturation |
| **5 GHz** | Medium‑High | Primary band for scanners |
| **6 GHz** | Optional | Future‑ready (sanitized) |

### 🔧 Channel Planning
- Use non‑overlapping 5 GHz channels  
- Minimize co‑channel interference  
- Normalize AP transmit power  

---

# 🔧 3. Wi‑Fi Configuration Template (Fill‑In‑The‑Blanks)

```
Site Name: ___________________________
AP Model: ____________________________
Controller: __________________________
Corporate SSID: ______________________
Guest SSID: __________________________
OT SSID: _____________________________
Corporate VLAN: ______________________
Guest VLAN: __________________________
OT VLAN: _____________________________
RADIUS Server: _______________________
DHCP Scope: __________________________
Channel Width: _______________________
Transmit Power: ______________________
```

---

# 🌐 4. Switch & VLAN Requirements

### 🔀 Switch Port Configuration
- Trunk mode for AP uplinks  
- Allow Corporate, Guest, OT VLANs  
- Validate PoE budget  

### 🧩 VLAN Isolation Rules
| VLAN | Allowed Traffic | Blocked Traffic |
|------|------------------|------------------|
| **Corporate** | Internal systems | Guest, OT |
| **Guest** | Internet only | Corporate, OT |
| **OT** | OT controllers | Corporate, Guest |

Related docs:  
- 🌐 [Network Topology](../architecture/network-topology.md)

---

# 📊 5. Monitoring & Telemetry Baseline

### 📡 Required Metrics
- AP uptime  
- Client count  
- RSSI  
- Roaming events  
- Channel utilization  
- DHCP success rate  

### 🧪 Validation Tests
- Walk test with scanner  
- Validate roaming between APs  
- Confirm SSID segmentation  
- Validate DHCP assignment  

Related scripts:  
- 📜 `wifi-coverage-scan.sh`

---

# 🔐 6. Authentication Workflow (Wi‑Fi Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | Device connects | Sends authentication request |
| 2 | RADIUS | Validates credentials (Corporate SSID) |
| 3 | VLAN Assignment | Device placed into correct VLAN |
| 4 | DHCP | IP assigned from correct scope |
| 5 | ACL Enforcement | Firewall rules applied |
| 6 | Monitoring | Device added to telemetry dashboard |

---

# 🛠️ 7. Infrastructure Engineering Workflow (Wi‑Fi Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Assessment | RF survey, AP count | RF baseline |
| Design | AP placement, channel plan | Wi‑Fi blueprint |
| Staging | Pre‑configure APs | Deployment kit |
| Deployment | Install APs | Updated Wi‑Fi |
| Testing | Validate signal & roaming | RF validation report |
| Monitoring | Enable telemetry | Wireless dashboard |

---

# 📊 8. Metrics Analyzed (Wi‑Fi Specific)

| Category | Metric | Purpose |
|----------|--------|----------|
| **Signal** | RSSI | Ensures coverage quality |
| **Roaming** | Handoff time | Validates seamless mobility |
| **Performance** | Throughput | Confirms AP density |
| **Health** | AP uptime | Detects failures |
| **Interference** | Channel utilization | Prevents congestion |

---

# 🔒 Confidentiality Notice
All Wi‑Fi configurations are sanitized for portfolio use.  
No internal UPS SSID names, RF maps, or proprietary controller settings are included.
