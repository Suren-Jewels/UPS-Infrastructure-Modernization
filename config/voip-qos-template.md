# 🎧 VoIP QoS Template  
**Standardized Quality of Service Configuration for SIP‑Based VoIP in UPS Facilities**

This template defines the standardized QoS configuration applied across all modernized UPS facilities.  
It ensures consistent prioritization of SIP traffic, stable call quality, predictable latency, and seamless integration with the Voice VLAN.

For related workflows, see:  
- ☎️ [VoIP Migration Guide](../docs/voip-migration-guide.md)  
- 🚀 [Deployment Overview](../docs/deployment-overview.md)  
- 📘 [Runbook](../docs/runbook.md)

For architecture context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)

---

# 🎯 Purpose of This Template

- Standardize QoS across all UPS facilities  
- Prioritize SIP signaling and RTP media streams  
- Reduce jitter, latency, and packet loss  
- Ensure consistent call quality across wired and wireless networks  
- Support SIP phones, softphones, and VoIP gateways  

---

# 🔀 1. Voice VLAN & Traffic Classification

### 🧩 VLAN Assignment

| Component | VLAN | Purpose |
|-----------|-------|----------|
| **VoIP Phones** | `<VOICE_VLAN>` | SIP traffic isolation |
| **SIP Gateway** | `<VOICE_VLAN>` | Call routing |
| **VoIP Controllers** | `<VOICE_VLAN>` | Centralized management |

### 🔧 Traffic Types

| Traffic Type | Description | Priority |
|--------------|-------------|----------|
| **SIP Signaling** | Call setup/teardown | High |
| **RTP Media** | Voice audio stream | Highest |
| **Management** | Phone provisioning | Medium |
| **Background** | Non‑voice traffic | Low |

---

# 🎚️ 2. QoS Marking (Sanitized)

### 📌 DSCP Values

| Traffic Type | DSCP Value | Notes |
|--------------|-------------|--------|
| **RTP (Audio)** | `<DSCP_AUDIO>` | Highest priority |
| **SIP Signaling** | `<DSCP_SIP>` | High priority |
| **Call Control** | `<DSCP_CONTROL>` | Medium priority |
| **Default Traffic** | `<DSCP_DEFAULT>` | Best effort |

### 🧪 Validation
- Confirm DSCP markings applied at phone  
- Validate markings preserved across switches/APs  
- Confirm SIP gateway honors DSCP values  

---

# 📡 3. Switch QoS Configuration

### 🔧 Required Settings
- Enable QoS globally  
- Trust DSCP on access ports  
- Prioritize RTP queues  
- Apply strict priority queueing for voice  

### 📁 Example Queue Mapping (Sanitized)

| Queue | Traffic | Notes |
|--------|----------|--------|
| **Q1** | RTP | Strict priority |
| **Q2** | SIP | High priority |
| **Q3** | Management | Medium |
| **Q4** | Default | Best effort |

---

# 📶 4. Wi‑Fi QoS Requirements

### 📡 WMM Mapping

| WMM Category | Traffic Type | Notes |
|--------------|--------------|--------|
| **Voice** | RTP | Highest priority |
| **Video** | SIP | High priority |
| **Best Effort** | Management | Standard |
| **Background** | Non‑voice | Lowest |

### 📶 AP Requirements
- Enable WMM  
- Ensure 5 GHz preferred for VoIP  
- Validate roaming performance  

Related docs:  
- 📶 [Wi‑Fi Expansion Guide](../docs/wifi-expansion-guide.md)

---

# 📞 5. SIP Gateway QoS Configuration

### 🔧 Required Settings
- Apply DSCP to outbound RTP  
- Honor DSCP on inbound RTP  
- Prioritize SIP signaling  
- Validate jitter buffer configuration  

### 📊 SIP Health Metrics
- Registration status  
- Jitter  
- Latency  
- Packet loss  
- MOS score  

Related scripts:  
- 📜 `voip-qos-validator.ps1`

---

# 🧪 6. QoS Validation Checklist

### ✔ Network Validation
- DSCP markings preserved end‑to‑end  
- RTP packets prioritized  
- No drops in voice queues  

### ✔ Call‑Quality Validation
- MOS score meets UPS standard  
- Latency < sanitized threshold  
- Jitter < sanitized threshold  
- Packet loss < sanitized threshold  

### ✔ Wireless Validation
- Roaming test with Wi‑Fi phone  
- Validate call stability during movement  

---

# 🔧 7. Configuration Template (Fill‑In‑The‑Blanks)

```
Site Name: ___________________________
Voice VLAN: __________________________
SIP Gateway IP: ______________________
DSCP (RTP): __________________________
DSCP (SIP): __________________________
Switch Model: ________________________
AP Model: ____________________________
Queue Mapping: _______________________
Validation Date: _____________________
Engineer: ____________________________
```

---

# 🔐 8. Authentication Workflow (VoIP QoS Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | Phone boots | Requests VLAN via LLDP‑MED |
| 2 | Switch assigns VLAN | Phone placed into Voice VLAN |
| 3 | DHCP | IP assigned from Voice scope |
| 4 | SIP Registration | Phone registers to SIP gateway |
| 5 | QoS Enforcement | DSCP applied to SIP/RTP |
| 6 | Monitoring | Phone added to voice dashboard |

---

# 🛠️ 9. Infrastructure Engineering Workflow (VoIP QoS Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Assessment | Identify PBX endpoints | Voice baseline |
| Design | Define VLAN, QoS, SIP config | VoIP blueprint |
| Staging | Pre‑configure phones | Deployment kit |
| Migration | Move endpoints to SIP | Updated voice infra |
| Testing | Validate MOS, jitter, latency | Call‑quality report |
| Monitoring | Enable SIP telemetry | Voice dashboard |

---

# 📊 10. Metrics Analyzed (VoIP QoS Specific)

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
All QoS configurations are sanitized for portfolio use.  
No internal UPS SIP settings, DSCP values, or proprietary gateway configurations are included.
