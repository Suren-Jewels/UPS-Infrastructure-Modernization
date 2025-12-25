# 🖥️ Device Provisioning Checklist  
**Standardized Provisioning Workflow for Windows (Intune) & macOS (Jamf) Devices in UPS Facilities**

This checklist defines the standardized provisioning workflow for all corporate devices deployed across modernized UPS facilities.  
It ensures consistent enrollment, security posture, compliance validation, and readiness for field or administrative use.

For related workflows, see:  
- 🖥️ [Remote Support Procedures](../docs/remote-support-procedures.md)  
- 📘 [Runbook](../docs/runbook.md)  
- 🚀 [Deployment Overview](../docs/deployment-overview.md)

For architecture context, see:  
- 🧱 [Architecture Layers](../architecture/architecture-layers.md)

---

# 🎯 Purpose of This Checklist

- Standardize device provisioning across all UPS facilities  
- Ensure consistent security baselines and compliance  
- Reduce onboarding time for new devices  
- Support remote management via Intune and Jamf  
- Improve reliability and reduce troubleshooting  

---

# 🧩 1. Device Intake & Preparation

### 📦 Intake Checklist
- Device model verified  
- Asset tag applied  
- Power‑on test completed  
- BIOS/firmware updated (sanitized)  
- Battery health validated (laptops)  

### 🔧 Pre‑Provisioning Steps
- Factory reset device  
- Connect to secure provisioning network  
- Validate internet connectivity  
- Confirm device assigned to correct user or role  

---

# 🪟 2. Windows Provisioning (Intune)

### 🧰 Enrollment Steps
- Connect to corporate Wi‑Fi or wired network  
- Sign in with corporate credentials  
- Device auto‑enrolls into Intune  
- Apply baseline configuration profiles  
- Apply security policies (sanitized)  

### 🔐 Security Baseline
| Category | Requirement |
|----------|-------------|
| **MFA** | Enabled |
| **BitLocker** | Enabled |
| **Defender** | Enabled |
| **Firewall** | Enabled |
| **Compliance** | Must pass all checks |

### 🧪 Validation
- Confirm device appears in Intune portal  
- Validate compliance status  
- Confirm apps installed (sanitized list)  
- Validate VPN, Wi‑Fi, and SSO  

---

# 🍎 3. macOS Provisioning (Jamf)

### 🧰 Enrollment Steps
- Connect to corporate Wi‑Fi or wired network  
- Device auto‑enrolls via ADE (sanitized)  
- Apply configuration profiles  
- Apply security baselines  

### 🔐 Security Baseline
| Category | Requirement |
|----------|-------------|
| **FileVault** | Enabled |
| **Firewall** | Enabled |
| **Gatekeeper** | Enabled |
| **Compliance** | Must pass all checks |

### 🧪 Validation
- Confirm device appears in Jamf console  
- Validate configuration profiles applied  
- Confirm app deployment  
- Validate VPN, Wi‑Fi, and SSO  

---

# 🧰 4. Application Deployment

### 📦 Required Apps (Sanitized)
| Category | Example |
|----------|----------|
| **Productivity** | Office Suite |
| **Security** | Endpoint protection |
| **Communication** | Teams |
| **Logistics Tools** | Scanner/warehouse apps |

### 🧪 Validation
- Confirm all required apps installed  
- Validate app launch and sign‑in  
- Confirm background services running  

---

# 🌐 5. Network & Connectivity Validation

### 📡 Required Tests
- Corporate Wi‑Fi connectivity  
- VPN connection  
- Access to internal systems (sanitized)  
- DNS resolution  
- Certificate validation  

---

# 📁 6. Device Configuration Template (Fill‑In‑The‑Blanks)

```
Device Type: ___________________________
Operating System: ______________________
User/Role: _____________________________
Asset Tag: _____________________________
Serial Number: _________________________
Enrollment Method: _____________________
Compliance Status: _____________________
Apps Installed: ________________________
Validation Date: _______________________
Engineer: ______________________________
```

---

# 🧪 7. Final Validation Checklist

### ✔ System Validation
- Device enrolled in Intune/Jamf  
- Compliance status: **Pass**  
- Security baselines applied  
- Required apps installed  

### ✔ Network Validation
- Wi‑Fi validated  
- VPN validated  
- Internal access validated  

### ✔ User Readiness
- User sign‑in tested  
- Email and SSO validated  
- Device labeled and documented  

---

# 🔐 8. Authentication Workflow (Provisioning Context)

| Step | Component | Description |
|------|-----------|-------------|
| 1 | Device boots | Requests DHCP from provisioning network |
| 2 | Enrollment | Device joins Intune/Jamf |
| 3 | Policy Application | Security baselines applied |
| 4 | App Deployment | Required apps installed |
| 5 | Compliance Check | Device validated |
| 6 | Monitoring | Device added to dashboard |

---

# 🛠️ 9. Infrastructure Engineering Workflow (Provisioning Context)

| Phase | Engineering Activity | Output |
|-------|----------------------|--------|
| Intake | Receive device | Device baseline |
| Enrollment | Intune/Jamf setup | Managed device |
| Configuration | Apply baselines | Secured device |
| Validation | Test apps & network | Provisioning report |
| Handoff | Deliver to user | Ready device |

---

# 📊 10. Metrics Analyzed (Provisioning Specific)

| Category | Metric | Purpose |
|----------|--------|----------|
| **Compliance** | Pass/fail | Ensures security posture |
| **Apps** | Install success | Confirms readiness |
| **Network** | Wi‑Fi/VPN | Validates connectivity |
| **Security** | Baseline applied | Confirms protection |
| **Enrollment** | Intune/Jamf status | Confirms management |

---

# 🔒 Confidentiality Notice
All provisioning configurations are sanitized for portfolio use.  
No internal UPS MDM settings, proprietary apps, or corporate credentials are included.
