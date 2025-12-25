# ☎️ VoIP Migration Guide  
**UPS Facility Modernization — SIP Migration & Voice Infrastructure Upgrade**

This guide defines the standardized process for migrating legacy PBX systems to SIP‑based VoIP across UPS facilities.  
It ensures consistent VLAN segmentation, QoS enforcement, endpoint provisioning, and call‑quality validation.

For architectural context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)  
- 📊 [Architecture Diagram](../architecture/architecture-diagram.md)

For deployment sequencing, see:  
- 🚀 [Deployment Overview](deployment-overview.md)

---

# 🎯 Objectives of VoIP Modernization

- Replace aging PBX systems with SIP‑based VoIP  
- Improve call quality and reliability  
- Standardize Voice VLAN across all facilities  
- Enforce QoS for latency‑sensitive traffic  
- Integrate VoIP telemetry into monitoring dashboards  
- Reduce operational costs and simplify support  

---

# 🧭 1. VoIP Migration Workflow

| Phase | Activity | Output |
|-------|----------|--------|
| **Assessment** | Identify PBX endpoints, validate SIP readiness | Voice baseline report |
| **Design** | Define Voice VLAN, QoS, SIP gateway config | VoIP modernization blueprint |
| **Staging** | Pre‑configure phones, SIP profiles | Deployment kit |
| **Migration** | Move endpoints to SIP, validate calls | Updated voice infrastructure |
| **Testing** | MOS score, latency, jitter validation | Call‑quality report |
| **Monitoring** | Enable SIP telemetry | Voice health dashboard |

Related docs:  
- 📘 [Runbook](runbook.md)

---

# 🔀 2. Voice VLAN & Network Architecture

### 🧩 VLAN Structure
| VLAN | Purpose |
|------|---------|
| **Voice VLAN** | SIP phones, VoIP gateways |
| **Corporate VLAN** | Laptops, PCs, servers |
| **Camera VLAN** | IP cameras |
| **OT VLAN** | Industrial devices |

### 🔧 Switch Configuration
- Assign phone ports to **Voice VLAN**  
- Enable LLDP‑MED for auto‑provisioning  
- Validate PoE budget for all phones  

### 🔐 Firewall Rules
- Allow SIP signaling (sanitized ports)  
- Restrict Voice VLAN access to SIP gateway  
- Block lateral movement to Corporate and OT networks  

Related docs:  
- 🌐 [Network Topology](../architecture/network-topology.md)

---

# 🎧 3. QoS Configuration

### 📊 QoS Prioritization
- Prioritize SIP traffic using DSCP (sanitized value)  
- Apply QoS policies on switches and APs  
- Validate queueing behavior under load  

### 🧪 QoS Validation
- Measure jitter, latency, packet loss  
- Confirm MOS score meets UPS standards  
- Validate call stability during roaming (Wi‑Fi phones)  

Related scripts:  
- 📜 `voip-qos-validator.ps1`

---

# 📞 4. SIP Gateway Configuration

### 🔧 Pre‑Migration Steps
- Validate SIP trunk configuration  
- Confirm registration with upstream provider (sanitized)  
- Apply SIP profiles to endpoints  

### 🔄 Migration Steps
1. Move endpoints to Voice VLAN  
2. Register devices to SIP gateway  
3. Validate inbound/outbound calling  
4. Test voicemail and call routing  
5. Validate emergency calling (sanitized)  

---

# 🧪 5. Call‑Quality Validation

### 📊 Metrics to Validate
| Metric | Purpose |
|--------|----------|
| **MOS Score** | Measures call quality |
| **Latency** | Ensures real‑time audio |
| **Jitter** | Prevents audio distortion |
| **Packet Loss** | Ensures call stability |

### 🔧 Test Scenarios
- Internal extension‑to‑extension  
- External inbound/outbound  
- Long‑duration call stability  
- Roaming test (Wi‑Fi phones)  

---

# 🛠️ 6. Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Call drops | QoS misconfiguration | Validate DSCP, check packet loss |
| One‑way audio | NAT or firewall issue | Inspect ACLs, verify SIP ALG settings |
| No dial tone | SIP registration failure | Re-register device, validate SIP gateway |
| Poor call quality | High jitter or latency | Check MOS score, inspect network path |

Related docs:  
- 🛠️ [Troubleshooting Guide](troubleshooting-guide.md)

---

# 🔐 7. Authentication Workflow (VoIP Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | Phone boots | Requests VLAN via LLDP‑MED |
| 2 | Switch assigns VLAN | Phone placed into Voice VLAN |
| 3 | DHCP | Phone receives IP from Voice scope |
| 4 | SIP Registration | Phone registers to SIP gateway |
| 5 | QoS Enforcement | DSCP applied to SIP traffic |
| 6 | Monitoring | Phone added to voice dashboard |

---

# 🛠️ 8. Infrastructure Engineering Workflow (VoIP Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Assessment | Identify PBX endpoints | Voice baseline |
| Design | Define VLAN, QoS, SIP config | VoIP blueprint |
| Staging | Pre‑configure phones | Deployment kit |
| Migration | Move endpoints to SIP | Updated voice infra |
| Testing | Validate MOS, jitter, latency | Call‑quality report |
| Monitoring | Enable SIP telemetry | Voice dashboard |

---

# 📊 9. Metrics Analyzed (VoIP Specific)

| Category | Metric | Purpose |
|----------|--------|----------|
| **Quality** | MOS score | Measures audio clarity |
| **Network** | Jitter | Detects instability |
| | Latency | Ensures real‑time audio |
| | Packet loss | Prevents call drops |
| **SIP** | Registration status | Confirms endpoint health |
| | SIP response time | Validates gateway performance |

---

# 🔒 Confidentiality Notice
All VoIP modernization procedures are sanitized for portfolio use.  
No internal UPS SIP configurations, phone models, or proprietary routing details are included.
