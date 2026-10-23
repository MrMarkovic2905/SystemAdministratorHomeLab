# 🛠️ System Administration & IT Support Home Lab

[ 🇬🇧 English ] | [ 🇩🇪 Deutsch ]

---

## 🇩🇪 Über dieses Projekt (Deutsch)
Willkommen in meinem IT-Praxis-Portfolio! In diesem Repository dokumentiere ich meine praktischen Übungen, Systemkonfigurationen und praxisnahen Troubleshooting-Szenarien in der Netzwerk- und Systemadministration. 

Mein Ziel ist es, ein tiefes praktisches Verständnis für moderne IT-Infrastrukturen (On-Premise & Cloud) zu demonstrieren und reale administrative Aufgaben effizient zu lösen.

---

## 🇬🇧 About This Project (English)
Welcome to my hands-on IT portfolio! In this repository, I document my practical exercises, system configurations, and real-world troubleshooting scenarios in Network and System Administration.

My goal is to demonstrate a solid, practical understanding of modern IT infrastructure (On-Premise & Cloud) and to solve everyday administrative tasks efficiently.

---

## 📐 Lab Architecture / Laborarchitektur

* **Hypervisor:** Oracle VM VirtualBox
* **Directory Services:** Windows Server 2022 (Active Directory Domain Services)
* **Cloud Infrastructure:** Microsoft 365 Developer Tenant (Entra ID / Exchange Online)
* **Linux Environment:** Ubuntu Server (SSH, CLI Management)
* **Workstation:** Windows 11 Enterprise (Joined to Domain)

---

## 📂 Projects & Configurations / Projekte & Konfigurationen

### 1. Active Directory & Windows Server (AD DS)
* **Domain Setup:** Deployment of `techcorp.local` domain environment.
* **OU Structure & RBAC:** Designed Organizational Units (Management, IT, HR / Personalwesen, Sales / Vertrieb) following the **Least Privilege Principle**.
* **User & Group Management:** User onboarding/offboarding, temporary password policies, and security group assignments for resource access.
* **Group Policy Management (GPO):** Centralized mapping of network drives and restriction of unauthorized USB storage devices.

> 📸 *[ Screenshot: Active Directory Users and Computers / GPO Management ]*

---

### 2. Microsoft 365 & Entra ID (Cloud Administration)
* **Tenant Management:** Hands-on administration via Microsoft 365 Admin Center (`admin.microsoft.com`).
* **Shared Mailboxes:** Created and configured cost-effective Shared Mailboxes (e.g., `support@techcorp-lab.com`) with delegated access permissions (Full Access / Send As).
* **Security & Licensing:** License allocation optimization and Multi-Factor Authentication (MFA) enforcement.

> 📸 *[ Screenshot: Microsoft 365 Admin Center / Shared Mailbox Setup ]*

---

### 3. Network Troubleshooting & Diagnostics
* **Methodology:** Systematic "Bottom-Up" troubleshooting approach (Physical -> IP Layer -> DNS Resolution).
* **CLI Tools Used:** `ping`, `ipconfig /flushdns`, `nslookup`, `tracert`, `netstat`.
* **DNS Incident Resolution:** Diagnosed DNS failure scenarios and implemented fallback configurations to public DNS resolvers (Google `8.8.8.8` / Cloudflare `1.1.1.1`).

---

### 4. Linux Server Administration (Ubuntu CLI)
* **Remote Access:** Secure remote server management via SSH (Port 22).
* **File System & Permissions:** Command-line navigation (`cd`, `ls -la`, `pwd`) and privilege escalation (`sudo`).
* **Log Analysis:** System diagnostics and log inspection using `grep`, `tail -f`, and `journalctl`.

---

## ✉️ Contact / Kontakt
* **LinkedIn:** www.linkedin.com/in/mrmarkovic29
