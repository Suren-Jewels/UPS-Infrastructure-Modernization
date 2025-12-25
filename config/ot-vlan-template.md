# 🏭 OT VLAN Template  
**Standardized VLAN & Network Configuration for Industrial OT Devices (SICK Lasers, Encoders, Sensors)**

This template defines the standardized VLAN, switch, firewall, and network configuration for OT (Operational Technology) devices across all modernized UPS facilities.  
It ensures consistent segmentation, deterministic traffic flow, telemetry visibility, and protection of industrial systems.

For related workflows, see:  
- 🏭 [SICK Laser Maintenance](../docs/sick-laser-maintenance.md)  
- 📏 [Encoder Support Guide](../docs/encoder-support-guide.md)  
- 🚀 [Deployment Overview](../docs/deployment-overview.md)  
- 📘 [Runbook](../docs/runbook.md)

For architecture context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)

---

# 🎯 Purpose of This Template

- Standardize OT VLAN configuration across all UPS facilities  
- Ensure deterministic, low‑latency communication for industrial devices  
- Protect OT systems from Corporate, Guest, Voice, and Camera networks  
- Support telemetry for SICK lasers, encoders, and industrial sensors  
- Reduce troubleshooting time and configuration drift  

---

# 🧩 1. OT VLAN Definition

### 🌐 VLAN Structure (Sanitized)

| Component | VLAN | Purpose |
|-----------|-------|----------|
| **SICK Lasers** | `<OT_VLAN>` | Industrial detection systems |
| **Encoders** | `<OT_VLAN>` | Conveyor synchronization |
| **OT Controllers** | `<OT_VLAN>` | Industrial logic control |
| **Monitoring Collector** | `<OT_VLAN>` | Telemetry polling |

### 🔧 VLAN Requirements
- Layer‑2 isolation from Corporate, Guest, Voice, and Camera VLANs  
- Layer‑3 access only to OT controllers and monitoring systems  
- DHCP scope dedicated to OT devices  
- Deterministic traffic flow (low jitter, low latency)  

---

# 🔌 2. Switch Port Configuration

### 🧰 Access Port Template
```
switchport mode access
switchport access vlan <OT_VLAN>
spanning-tree portfast
```

### 🔀 Trunk Port Requirements
- Allow `<OT_VLAN>`  
- Allow Management VLAN (for switch control)  
- Block Guest VLAN  

### 🔧 OT Device Requirements
- No PoE required (unless sensor‑specific)  
- Fixed speed/duplex recommended for stability  
- LLDP optional depending on device model  

Related docs:  
- 🏭 [SICK Laser Maintenance](../docs/sick-laser-maintenance.md)  
- 📏 [Encoder Support Guide](../docs/encoder-support-guide.md)

---

# 🔐 3. Firewall & ACL Requirements

### 🚫 Blocked Traffic
| Source | Destination | Action |
|--------|-------------|--------|
| OT VLAN | Corporate VLAN | Block |
| OT VLAN | Guest VLAN | Block |
| OT VLAN | Camera VLAN | Block |
| OT VLAN | Voice VLAN | Block |

### ✅ Allowed Traffic
| Source | Destination | Purpose |
|--------|-------------|----------|
| OT VLAN | OT Controllers | Industrial control |
| OT VLAN | Monitoring Collector | Telemetry |
| OT Controllers | OT VLAN | Command/response |

### 🔒 Security Notes
- OT devices must not reach the internet  
- OT controllers must not communicate with Corporate systems  
- No lateral movement allowed between OT devices  

---

# 📡 4. Monitoring & Telemetry Baseline

### 📊 Required Metrics
- Pulse count (encoders)  
- Pulse consistency  
- Alignment status (SICK lasers)  
- Error codes  
- Temperature (if supported)  
- Uptime  
- VLAN connectivity  

### 🧪 Validation Tests
- Confirm device reachable  
- Validate telemetry events  
- Trigger test alerts  
- Confirm OT controller registration  

Related scripts:  
- 📜 `snmp-telemetry-poll.py`

---

# 📐 5. OT Device Configuration Template (Fill‑In‑The‑Blanks)

```
Site Name: ___________________________
OT VLAN: _____________________________
OT Controller IP: ____________________
DHCP Scope: __________________________
Device Type: _________________________
Device IP: ___________________________
Switch Model: ________________________
Port Number: _________________________
Speed/Duplex: ________________________
Validation Date: _____________________
Engineer: ____________________________
```

---

# 🔧 6. OT Controller Integration Template

### 🧩 Required Settings
- Static IP for OT controller  
- Register SICK lasers and encoders  
- Validate event logging  
- Confirm synchronization between devices  

### 📊 OT Health Metrics
- Event frequency  
- Pulse variance  
- Alignment drift  
- Controller uptime  

---

# 🔐 7. Authentication Workflow (OT VLAN Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | OT device boots | Requests DHCP from OT VLAN |
| 2 | Switch assigns VLAN | Device placed into OT VLAN |
| 3 | DHCP | IP assigned from OT scope |
| 4 | OT Controller Registration | Device added to OT system |
| 5 | ACL Enforcement | Device restricted to OT traffic only |
| 6 | Monitoring | Device added to OT dashboard |

---

# 🛠️ 8. Infrastructure Engineering Workflow (OT VLAN Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Assessment | Inspect wiring, alignment | OT baseline |
| Design | Define VLAN, controller mapping | OT blueprint |
| Staging | Pre‑configure devices | Deployment kit |
| Deployment | Install devices | Updated OT infra |
| Testing | Validate pulse & alignment | OT validation report |
| Monitoring | Enable telemetry | OT dashboard |

---

# 📊 9. Metrics Analyzed (OT VLAN Specific)

| Category | Metric | Purpose |
|----------|--------|----------|
| **Performance** | Pulse count | Ensures conveyor accuracy |
| | Pulse consistency | Detects slippage |
| **Alignment** | Beam angle | Ensures detection accuracy |
| **Health** | Error codes | Identifies hardware issues |
| **Network** | OT VLAN connectivity | Confirms segmentation |
| **Telemetry** | Event frequency | Detects anomalies |

---

# 🔒 Confidentiality Notice
All OT VLAN configurations are sanitized for portfolio use.  
No internal UPS OT controller settings, proprietary calibration tools, or vendor‑specific device details are included.
