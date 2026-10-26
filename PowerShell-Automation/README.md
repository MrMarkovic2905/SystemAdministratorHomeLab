# 🚀 Automated AD User Onboarding (Infrastructure as Code / PowerShell)

## 📌 Overview
This project demonstrates an automated **Active Directory (AD DS)** user onboarding workflow using PowerShell and CSV data sources. It is designed to replace manual user creation in Enterprise environments, reducing setup time and eliminating human errors.

## 🔑 Key Features
* **CSV Data Ingestion:** Parses employee data dynamically from `users.csv`.
* **Dynamic OU Provisioning:** Checks if the target Organizational Unit (OU) exists; if not, it automatically creates it.
* **Standardized Identity Naming:** Enforces `firstname.lastname` account naming conventions and UPN syntax.
* **Security & Group Assignment (AGDLP):** Automatically creates Global Security Groups (`GG_Department`) and assigns new users to their respective department groups.
* **First-Logon Password Enforcement:** Generates temporary passwords and forces the user to change their password at the first interactive logon (`-ChangePasswordAtLogon $true`).

## 🛠️ PowerShell Cmdlets Used
* `Import-Csv` - Parses input dataset.
* `Get-ADOrganizationalUnit` / `New-ADOrganizationalUnit` - Manages OU structure.
* `Get-ADUser` / `New-ADUser` - Manages User Accounts.
* `Get-ADGroup` / `New-ADGroup` / `Add-ADGroupMember` - Implements AGDLP Role-Based Access Control (RBAC).

## 💻 How to Run
1. Clone this repository.
2. Edit `users.csv` with your target users.
3. Open PowerShell as Administrator on your Domain Controller or RSAT-enabled client.
4. Execute the script:
   ```powershell
   .\AutomatedOnboarding.ps1
