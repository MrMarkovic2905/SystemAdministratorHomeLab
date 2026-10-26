# ==============================================================================
# Script Name : AutomatedOnboarding.ps1
# Description : Automates Active Directory User Provisioning from CSV dataset
# Author      : Aleksandar Markovic
# Environment : Active Directory Domain Services (AD DS)
# ==============================================================================

# 1. Import the Active Directory PowerShell module
Import-Module ActiveDirectory

# Define paths and domain details
$csvPath = ".\users.csv"
$domainName = "techcorp.local"
$domainDN = "DC=techcorp,DC=local"

# 2. Read user data from the CSV file
$users = Import-Csv -Path $csvPath

# 3. Iterate through each employee record in the CSV file
foreach ($user in $users) {
    
    # Extract properties from CSV columns
    $firstName  = $user.FirstName
    $lastName   = $user.LastName
    $department = $user.Department
    $jobTitle   = $user.JobTitle
    
    # Format standardized SamAccountName (firstname.lastname)
    $username = ("{0}.{1}" -f $firstName.ToLower(), $lastName.ToLower())
    $userPrincipalName = "$username@$domainName"
    
    # Define target Organizational Unit (OU) path based on department
    $ouPath = "OU=$department,$domainDN"
    
    # A) Check if target Organizational Unit exists; create it if missing
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$department'")) {
        New-ADOrganizationalUnit -Name $department -Path $domainDN
        Write-Host "[+] Created new Organizational Unit (OU): $department" -ForegroundColor Green
    }
    
    # B) Define a secure default temporary password
    $securePassword = ConvertTo-SecureString "TempPass2026!" -AsPlainText -Force
    
    # C) Verify user uniqueness before account creation
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$username'")) {
        
        # Provision the Active Directory user account
        New-ADUser `
            -Name "$firstName $lastName" `
            -GivenName $firstName `
            -Surname $lastName `
            -SamAccountName $username `
            -UserPrincipalName $userPrincipalName `
            -Path $ouPath `
            -Title $jobTitle `
            -Department $department `
            -AccountPassword $securePassword `
            -Enabled $true `
            -ChangePasswordAtLogon $true
            
        Write-Host "[SUCCESS] User account '$username' successfully created in OU: $department" -ForegroundColor Cyan
        
        # D) AGDLP Implementation: Assign user to Department Security Group
        $groupName = "GG_$department"
        
        # Create department Global Security Group if it does not exist
        if (-not (Get-ADGroup -Filter "Name -eq '$groupName'")) {
            New-ADGroup -Name $groupName -GroupScope Global -GroupCategory Security -Path $ouPath
            Write-Host "[+] Created Security Group: $groupName" -ForegroundColor Yellow
        }
        
        # Add user to the Global Security Group
        Add-ADGroupMember -Identity $groupName -Members $username
        Write-Host "[+] Added user '$username' to group: $groupName" -ForegroundColor Yellow

    } else {
        Write-Host "[WARNING] User account '$username' already exists in Active Directory!" -ForegroundColor Red
    }
}
