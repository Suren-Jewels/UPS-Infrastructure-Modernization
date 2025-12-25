# 📚 Data Dictionary  
**UPS Infrastructure Modernization Program — Terminology & Definitions**

This data dictionary defines key terms used across the modernization program.  
It ensures consistent understanding across engineering, IT, OT, and field operations teams.

For architectural context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)  
- 📊 [Architecture Diagram](../architecture/architecture-diagram.md)  
- 📝 [Architecture Summary](../architecture/architecture-summary.md)

---

## 🔌 Power & UPS Terminology

| Term | Definition |
|------|------------|
| **UPS** | Uninterruptible Power Supply providing backup runtime and power conditioning. |
| **AGM Battery** | Absorbent Glass Mat battery used in many UPS units. |
| **Lithium Battery Module** | High‑efficiency battery option with longer lifecycle. |
| **Bypass Panel** | Electrical panel allowing UPS maintenance without downtime. |
| **SNMP Card** | Network module enabling UPS telemetry (runtime, load, battery health). |
| **Runtime** | Estimated minutes of power available during an outage. |
| **Load Percentage** | Percentage of UPS capacity currently in use. |

Related docs:  
- ⚡ [UPS Modernization Playbook](ups-modernization-playbook.md)  
- 📡 [Monitoring & Telemetry](../architecture/architecture-layers.md)

---

## 🌐 Network Terminology

| Term | Definition |
|------|------------|
| **Meraki Switch** | Cloud‑managed L2/L3 switch used for UPS facility networks. |
| **AP (Access Point)** | Wireless device providing Wi‑Fi coverage. |
| **SSID** | Wi‑Fi network name (corporate, guest, OT). |
| **VLAN** | Virtual LAN used to segment traffic (voice, cameras, OT, corporate). |
| **PoE** | Power over Ethernet used for cameras, VoIP phones, sensors. |
| **DHCP Scope** | IP address range assigned to devices in a VLAN. |

Related docs:  
- 📶 [Wi‑Fi Expansion Guide](wifi-expansion-guide.md)  
- 🌐 [Network Topology](../architecture/network-topology.md)

---

## ☎️ Voice & Communication Terminology

| Term | Definition |
|------|------------|
| **PBX** | Legacy phone system replaced during modernization. |
| **SIP** | Protocol used for VoIP communication. |
| **QoS** | Quality of Service rules prioritizing voice traffic. |
| **Voice VLAN** | Segmented network for VoIP phones. |

Related docs:  
- ☎️ [VoIP Migration Guide](voip-migration-guide.md)

---

## 🎥 Security & Surveillance Terminology

| Term | Definition |
|------|------------|
| **IP Camera** | Network‑connected camera powered via PoE. |
| **NVR** | Network Video Recorder storing camera footage. |
| **Camera VLAN** | Segmented network for surveillance devices. |

Related docs:  
- 🎥 [Camera Support Runbook](camera-support-runbook.md)

---

## 🏭 OT (Operational Technology) Terminology

| Term | Definition |
|------|------------|
| **SICK Laser** | Industrial scanner used for conveyor alignment and detection. |
| **Encoder** | Device measuring conveyor movement and position. |
| **OT VLAN** | Segmented network for industrial devices. |

Related docs:  
- 🏭 [SICK Laser Maintenance](sick-laser-maintenance.md)  
- 📏 [Encoder Support Guide](encoder-support-guide.md)

---

## 🖥️ Provisioning Terminology

| Term | Definition |
|------|------------|
| **Intune** | Cloud‑based Windows device management platform. |
| **Jamf** | macOS device management platform. |
| **Imaging** | Standardized OS deployment process. |
| **Enrollment** | Adding a device to Intune or Jamf for policy enforcement. |

Related docs:  
- 🖥️ [Remote Support Procedures](remote-support-procedures.md)

---

## 📡 Monitoring Terminology

| Term | Definition |
|------|------------|
| **SNMP Polling** | Automated collection of UPS and network telemetry. |
| **Alert Threshold** | Trigger point for warnings (temperature, runtime, voltage). |
| **Dashboard** | Centralized monitoring interface (sanitized). |

Related scripts:  
- 📜 `ups-health-check.ps1`  
- 📜 `snmp-telemetry-poll.py`  

---

## 🔒 Confidentiality Notice
All definitions are sanitized and generalized for portfolio use.  
No internal UPS terminology, proprietary systems, or sensitive identifiers are included.
