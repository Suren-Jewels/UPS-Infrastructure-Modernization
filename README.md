# ⚡ UPS Infrastructure Modernization Program  
**Multi‑Site Modernization • UPS Replacement • Network Upgrades • IT/OT Field Engineering**

---

## ✨ Overview
A multi‑site modernization initiative spanning ~10 UPS facilities across the Northwestern United States.  
This program combined **facility‑wide UPS replacement**, **distributed modernization workflows**, and **enterprise IT/OT upgrades**, including Wi‑Fi expansion, VoIP migration, device provisioning, and monitoring improvements.

The work required cross‑team coordination, zero‑downtime execution, and standardized deployment kits to ensure consistent results across all locations.

**Role:** Infrastructure Automation & Network Engineer  
**Duration:** Jan 2023 – May 2023  
**Scope:** 10 UPS facilities (multi‑state)

---

## ⚡ Quick Start
Explore the core components of this modernization program:

- 📐 Architecture → [`/architecture`](architecture/)  
- 📄 Documentation → [`/docs`](docs/)  
- ⚙ Configuration Templates → [`/config`](config/)  
- 🧰 Automation & Diagnostics → [`/scripts`](scripts/)  

All files are sanitized and structured for portfolio demonstration.

---

## 🧾 System Summary
This repository models the modernization lifecycle across multiple UPS facilities, including:

- **UPS replacement & battery modernization**  
- **Distributed deployment workflows** for multi‑site rollouts  
- **SNMP‑based UPS monitoring & telemetry upgrades**  
- **Wi‑Fi expansion and RF planning**  
- **VoIP migration from legacy PBX to SIP**  
- **Security camera (CCTV/IP) support & NVR integration**  
- **Network printer deployment & queue standardization**  
- **SICK laser & encoder maintenance (OT systems)**  
- **Server, PC, and laptop provisioning**  
- **Remote support workflows**  
- **HR onboarding/offboarding support**  

This repo consolidates the operational, technical, and automation components required to modernize distributed UPS facilities with zero service disruption.

---

## 💡 Why This Work Matters
UPS facilities depend on **continuous power**, **stable connectivity**, and **reliable communication systems**.  
This modernization program delivered:

- Higher operational uptime  
- Improved network reliability  
- Standardized IT/OT support workflows  
- Reduced communication costs  
- Stronger monitoring and telemetry  
- Faster provisioning and remote support  

The result was a measurable improvement in facility performance, safety, and operational efficiency.

---

## 🎯 Responsibilities & Scope
- Modernized UPS systems across 10+ facilities  
- Upgraded Wi‑Fi infrastructure, improving coverage by 30%  
- Migrated legacy phone systems to VoIP, reducing costs by 20%  
- Implemented SNMP‑based UPS monitoring and alerting  
- Supported security camera deployments and NVR integrations  
- Maintained SICK lasers, encoders, and industrial sensors  
- Provisioned servers, PCs, and laptops using Intune & Jamf  
- Automated compliance checks and network provisioning  
- Delivered remote support and on‑site troubleshooting  
- Coordinated with UPS IT, facilities, and field teams  

---

## 🛠️ Technologies & Tools

### Platform Stack

| Category | Technologies | Purpose |
|----------|--------------|----------|
| 🔌 **UPS & Power** | SNMP monitoring, UPS telemetry | Runtime tracking, alerting, battery lifecycle |
| 📡 **Networking** | Cisco Meraki, VLANs, Wi‑Fi planning | Multi‑site network modernization |
| ☎️ **VoIP** | SIP, VoIP gateways, QoS | PBX → VoIP migration |
| 🎥 **Security Systems** | IP cameras, NVR systems, PoE | Facility surveillance modernization |
| 🖨️ **Print Services** | Network printers, drivers | Standardized print workflows |
| 🖥️ **Provisioning** | Intune, Jamf, imaging | Server/PC/laptop deployment |
| ⚙️ **Automation** | PowerShell, Bash, SQL | Compliance checks, provisioning, telemetry |
| 🧰 **Operations** | ServiceNow, remote support tools | Change management & field coordination |

---

## 🗂️ Repository Structure

```
UPS-Infrastructure-Modernization/
│
├── architecture/
│   ├── modernization-overview.md
│   ├── multi-site-deployment-diagram.md
│   ├── network-topology.md
│   └── power-architecture.md
│
├── docs/
│   ├── deployment-overview.md
│   ├── ups-modernization-playbook.md
│   ├── wifi-expansion-guide.md
│   ├── voip-migration-guide.md
│   ├── camera-support-runbook.md
│   ├── sick-laser-maintenance.md
│   ├── encoder-support-guide.md
│   └── remote-support-procedures.md
│
├── config/
│   ├── ups-monitoring-template.md
│   ├── snmp-profile-template.md
│   ├── wifi-baseline-template.md
│   ├── voip-qos-template.md
│   ├── printer-standardization-template.md
│   └── device-provisioning-checklist.md
│
├── scripts/
│   ├── ups-health-check.ps1
│   ├── snmp-telemetry-poll.py
│   ├── wifi-coverage-scan.sh
│   ├── voip-qos-validator.ps1
│   ├── device-provisioning.ps1
│   └── signal-check.sh
│
└── README.md
```

---

### ▣ Key Files

#### 📐 Architecture  
- [`modernization-overview.md`](architecture/modernization-overview.md)  
- [`multi-site-deployment-diagram.md`](architecture/multi-site-deployment-diagram.md)  
- [`network-topology.md`](architecture/network-topology.md)  
- [`power-architecture.md`](architecture/power-architecture.md)  

#### 📄 Documentation  
- [`deployment-overview.md`](docs/deployment-overview.md)  
- [`ups-modernization-playbook.md`](docs/ups-modernization-playbook.md)  
- [`wifi-expansion-guide.md`](docs/wifi-expansion-guide.md)  
- [`voip-migration-guide.md`](docs/voip-migration-guide.md)  
- [`camera-support-runbook.md`](docs/camera-support-runbook.md)  
- [`sick-laser-maintenance.md`](docs/sick-laser-maintenance.md)  
- [`encoder-support-guide.md`](docs/encoder-support-guide.md)  
- [`remote-support-procedures.md`](docs/remote-support-procedures.md)  

#### ⚙ Configuration  
- [`ups-monitoring-template.md`](config/ups-monitoring-template.md)  
- [`snmp-profile-template.md`](config/snmp-profile-template.md)  
- [`wifi-baseline-template.md`](config/wifi-baseline-template.md)  
- [`voip-qos-template.md`](config/voip-qos-template.md)  
- [`printer-standardization-template.md`](config/printer-standardization-template.md)  
- [`device-provisioning-checklist.md`](config/device-provisioning-checklist.md)  

#### 🧰 Scripts  
- [`ups-health-check.ps1`](scripts/ups-health-check.ps1)  
- [`snmp-telemetry-poll.py`](scripts/snmp-telemetry-poll.py)  
- [`wifi-coverage-scan.sh`](scripts/wifi-coverage-scan.sh)  
- [`voip-qos-validator.ps1`](scripts/voip-qos-validator.ps1)  
- [`device-provisioning.ps1`](scripts/device-provisioning.ps1)  
- [`signal-check.sh`](scripts/signal-check.sh)  

---

## 🚀 Deployment Workflow

| Step | Action | Purpose |
|------|--------|----------|
| 1 | Assess facility readiness | Identify UPS, network, and device gaps |
| 2 | Deploy UPS modernization kit | Standardize hardware and runtime |
| 3 | Upgrade Wi‑Fi & network | Improve coverage and reliability |
| 4 | Migrate PBX → VoIP | Reduce costs and improve communication |
| 5 | Implement monitoring & telemetry | Enable SNMP alerts and dashboards |
| 6 | Provision devices | Standardize servers, PCs, laptops |
| 7 | Validate & document | Ensure compliance and operational readiness |

---

## 📈 Key Outcomes

| Outcome | Description |
|---------|-------------|
| 💬 **20% Communication Cost Reduction** | Achieved through VoIP migration |
| 📶 **30% Wi‑Fi Coverage Increase** | Improved logistics and warehouse connectivity |
| ⚡ **UPS Runtime Stability** | Standardized batteries and monitoring |
| 🛠️ **Faster Troubleshooting** | Automated checks and SNMP telemetry |
| 🧩 **Cross‑Team Alignment** | Zero downtime across all modernization phases |

---

## 🔐 Security & Access Control
All content is sanitized.  
No internal UPS configurations, credentials, diagrams, or sensitive operational details are included.

---

## 🔒 Confidentiality Notice
This repository contains high‑level, illustrative examples only.  
All sensitive information has been removed in accordance with UPS security policy and NDA requirements.

---

## 👔 Professional Context
**Suren Jewels**  
Senior Cloud Engineer | Infrastructure & Security Specialist  

For professional inquiries, connect via LinkedIn:  
https://www.linkedin.com/in/suren-jewels/
