# 🛠️ Troubleshooting Guide  
**UPS Infrastructure Modernization — Field & Engineering Diagnostics**

This guide provides structured troubleshooting procedures for UPS, network, Wi‑Fi, VoIP, camera, OT, and provisioning systems across modernized UPS facilities.  
It is designed for field engineers, network engineers, OT technicians, and remote support teams.

For operational workflows, see:  
- 📘 [Runbook](runbook.md)  
- 🚀 [Deployment Overview](deployment-overview.md)

For architectural context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)

---

# 🔌 UPS Troubleshooting

### ⚠️ Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| UPS not reporting SNMP | Incorrect VLAN, cable issue, SNMP card offline | Verify VLAN, reseat cable, reboot SNMP card |
| Runtime inaccurate | Battery calibration needed | Perform runtime calibration cycle |
| High load percentage | Overloaded circuits | Redistribute load or upgrade UPS capacity |
| Temperature alerts | Poor ventilation | Clear airflow, inspect fans, check environment |

Related docs:  
- ⚡ [UPS Modernization Playbook](ups-modernization-playbook.md)

Related scripts:  
- 📜 `ups-health-check.ps1`

---

# 🌐 Network Troubleshooting

### ⚠️ Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Switch offline | Power loss, bad uplink | Validate PoE, check uplink, inspect SFP |
| VLAN not applying | Misconfigured trunk/access port | Reapply VLAN template, verify tagging |
| DHCP failures | Scope exhaustion or VLAN mismatch | Expand scope, validate VLAN assignment |
| High latency | Congestion or loop | Check port utilization, STP status |

Related docs:  
- 📶 [Wi‑Fi Expansion Guide](wifi-expansion-guide.md)

Related scripts:  
- 📜 `snmp-telemetry-poll.py`

---

# 📶 Wi‑Fi Troubleshooting

### ⚠️ Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Dead zones | AP misplacement | Validate RF map, reposition AP |
| Weak signal | Interference or distance | Adjust channel, increase AP density |
| Authentication failures | Incorrect SSID or RADIUS issue | Validate SSID, check RADIUS logs |
| Roaming issues | AP power imbalance | Normalize AP transmit power |

Related docs:  
- 🌐 [Network Topology](../architecture/network-topology.md)

Related scripts:  
- 📜 `wifi-coverage-scan.sh`

---

# ☎️ VoIP Troubleshooting

### ⚠️ Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Call drops | QoS misconfiguration | Validate DSCP, check packet loss |
| No dial tone | SIP registration failure | Re-register device, validate SIP gateway |
| One‑way audio | NAT or firewall issue | Inspect ACLs, verify SIP ALG settings |
| Poor call quality | High jitter or latency | Check MOS score, inspect network path |

Related docs:  
- ☎️ [VoIP Migration Guide](voip-migration-guide.md)

Related scripts:  
- 📜 `voip-qos-validator.ps1`

---

# 🎥 Camera Troubleshooting

### ⚠️ Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Camera offline | PoE issue or VLAN mismatch | Validate PoE, confirm Camera VLAN |
| No video stream | NVR registration failure | Re-add camera, validate RTSP stream |
| Choppy video | High bitrate or congestion | Lower bitrate, check switch utilization |
| IR not working | Hardware fault | Inspect IR LEDs, replace camera if needed |

Related docs:  
- 🎥 [Camera Support Runbook](camera-support-runbook.md)

---

# 🏭 OT Troubleshooting (SICK Lasers & Encoders)

### ⚠️ Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Laser misalignment | Physical impact or vibration | Realign using SICK calibration tool |
| No laser telemetry | OT VLAN issue | Validate OT VLAN, check cabling |
| Encoder pulse drops | Mechanical wear | Inspect encoder wheel, replace if needed |
| Conveyor desync | Encoder misread | Recalibrate encoder, inspect belt tension |

Related docs:  
- 🏭 [SICK Laser Maintenance](sick-laser-maintenance.md)  
- 📏 [Encoder Support Guide](encoder-support-guide.md)

---

# 🖥️ Device Provisioning Troubleshooting

### ⚠️ Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Device not enrolling | Intune/Jamf profile issue | Reapply profile, validate network |
| Policy not applying | Sync delay | Force sync, validate compliance |
| Imaging failures | USB or network issue | Reimage device, validate boot media |
| App deployment stuck | MDM queue backlog | Restart MDM agent, retry deployment |

Related docs:  
- 🖥️ [Remote Support Procedures](remote-support-procedures.md)

Related scripts:  
- 📜 `device-provisioning.ps1`

---

# 📡 Monitoring & Telemetry Troubleshooting

### ⚠️ Common Issues & Resolutions

| Issue | Likely Cause | Resolution |
|-------|--------------|------------|
| Missing UPS metrics | SNMP disabled | Re-enable SNMP, validate community string |
| Switch/AP not reporting | Cloud disconnect | Validate WAN, check Meraki dashboard |
| Alert storms | Threshold misconfiguration | Adjust thresholds, validate sensor accuracy |
| Dashboard gaps | Polling interval too long | Reduce interval, validate collector health |

Related docs:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)

---

# 🔒 Confidentiality Notice
All troubleshooting procedures are sanitized for portfolio use.  
No internal UPS configurations, IP ranges, or proprietary workflows are included.
