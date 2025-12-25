# 🖨️ Printer Standardization Template  
**Standardized Configuration for Networked Printers in UPS Facilities**

This template defines the standardized configuration for networked printers across all modernized UPS facilities.  
It ensures consistent VLAN segmentation, driver configuration, naming conventions, monitoring integration, and security posture.

For related workflows, see:  
- 📘 [Runbook](../docs/runbook.md)  
- 🚀 [Deployment Overview](../docs/deployment-overview.md)

For architecture context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)  
- 🗺️ [Network Topology](../architecture/network-topology.md)

---

# 🎯 Purpose of This Template

- Standardize printer configuration across all UPS facilities  
- Ensure predictable network behavior and VLAN segmentation  
- Improve reliability for label printers, office printers, and industrial printers  
- Reduce troubleshooting time and configuration drift  
- Support monitoring and remote support workflows  

---

# 🧩 1. Printer VLAN Definition

### 🌐 VLAN Structure (Sanitized)

| Component | VLAN | Purpose |
|-----------|-------|----------|
| **Label Printers** | `<PRINTER_VLAN>` | Warehouse & logistics printing |
| **Office Printers** | `<PRINTER_VLAN>` | Administrative printing |
| **Industrial Printers** | `<PRINTER_VLAN>` | OT‑adjacent printing |
| **Monitoring Collector** | `<PRINTER_VLAN>` | Telemetry polling |

### 🔧 VLAN Requirements
- Layer‑2 isolation from Guest, Camera, and OT VLANs  
- Layer‑3 access only to print servers and monitoring systems  
- DHCP scope dedicated to printers  

---

# 🖨️ 2. Printer Naming Convention

### 🏷️ Standard Format
```
<SiteCode>-<Zone>-<PrinterType>-<Number>
```

### 📝 Examples (Sanitized)
| Printer Type | Example Name |
|--------------|--------------|
| Label Printer | SEA‑WH1‑LBL‑01 |
| Office Printer | SEA‑ADM‑PRT‑02 |
| Industrial Printer | SEA‑OT‑PRT‑01 |

---

# 🔌 3. Switch Port Configuration

### 🧰 Access Port Template
```
switchport mode access
switchport access vlan <PRINTER_VLAN>
spanning-tree portfast
```

### 🔧 Printer Requirements
- Static IP recommended  
- LLDP optional  
- No PoE required (unless model‑specific)  

---

# 🔐 4. Firewall & ACL Requirements

### 🚫 Blocked Traffic
| Source | Destination | Action |
|--------|-------------|--------|
| Printer VLAN | Guest VLAN | Block |
| Printer VLAN | Camera VLAN | Block |
| Printer VLAN | OT VLAN | Block |

### ✅ Allowed Traffic
| Source | Destination | Purpose |
|--------|-------------|----------|
| Printer VLAN | Print Server | Print jobs |
| Printer VLAN | Monitoring Collector | Telemetry |
| Print Server | Printer VLAN | Driver communication |

### 🔒 Security Notes
- Printers must not reach the internet  
- Only print servers may communicate with printers  
- No lateral movement allowed between printers  

---

# 🧰 5. Driver & Protocol Standardization

### 📄 Required Protocols
| Protocol | Purpose |
|----------|----------|
| **IPP** | Standard print communication |
| **LPD** | Legacy support (optional) |
| **SNMP** | Monitoring & telemetry |

### 🖨️ Driver Requirements
- Use universal print drivers where possible  
- Disable unused protocols (FTP, Telnet, HTTP)  
- Enable secure management interface (HTTPS)  

---

# 📡 6. Monitoring & Telemetry Baseline

### 📊 Required Metrics
- Printer uptime  
- Toner/ink levels (if supported)  
- Paper/jam status  
- Print queue length  
- SNMP health metrics  

### 🧪 Validation Tests
- Confirm printer reachable  
- Validate SNMP telemetry  
- Test print job from print server  
- Confirm naming convention applied  

Related scripts:  
- 📜 `snmp-telemetry-poll.py`

---

# 🧾 7. Configuration Template (Fill‑In‑The‑Blanks)

```
Site Name: ___________________________
Printer VLAN: ________________________
Printer Type: _________________________
Printer Name: _________________________
Static IP: ____________________________
Driver Type: __________________________
Print Server: _________________________
SNMP Enabled: _________________________
Validation Date: ______________________
Engineer: _____________________________
```

---

# 🔐 8. Authentication Workflow (Printer Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | Printer boots | Requests DHCP from Printer VLAN |
| 2 | Switch assigns VLAN | Printer placed into Printer VLAN |
| 3 | DHCP | IP assigned from Printer scope |
| 4 | Print Server Registration | Printer added to print queue |
| 5 | ACL Enforcement | Printer restricted to print server |
| 6 | Monitoring | Printer added to telemetry dashboard |

---

# 🛠️ 9. Infrastructure Engineering Workflow (Printer Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Assessment | Identify printer types | Printer baseline |
| Design | Define VLAN, naming, drivers | Printer blueprint |
| Staging | Pre‑configure printers | Deployment kit |
| Deployment | Install printers | Updated print infra |
| Testing | Validate print jobs & telemetry | Printer validation report |
| Monitoring | Enable SNMP | Printer dashboard |

---

# 📊 10. Metrics Analyzed (Printer Specific)

| Category | Metric | Purpose |
|----------|--------|----------|
| **Health** | Uptime | Detects failures |
| | Jam status | Ensures reliability |
| **Supplies** | Toner/ink levels | Prevents downtime |
| **Network** | VLAN connectivity | Confirms segmentation |
| **Telemetry** | SNMP response | Validates monitoring |

---

# 🔒 Confidentiality Notice
All printer configurations are sanitized for portfolio use.  
No internal UPS print server settings, proprietary drivers, or vendor‑specific configurations are included.
