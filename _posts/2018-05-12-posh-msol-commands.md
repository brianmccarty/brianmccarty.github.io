---
layout: post
title: "Microsoft Online Commands"
date: 2018-05-12
tags: [PowerShell, MSOLService]
---

### **List users who a billing contacts**

```powershell
$role = Get-MsolRole -RoleName 'Company Administrator'

Get-MsolRoleMember -RoleObjectId $role.ObjectId
```

### **Update Alternative Address**

```powershell
Get-MsolUser -UserPrincipalName 'user@domain.com' | Set-MsolUser -AlternateEmailAddresses 'altuser@domain.com'
```

### **Change Technical Contact**

```powershell
Set-MsolCompanyContactInformation -TechnicalNotificationEmails 'user@domain.com'
```

### **List Licensed Users**

```powershell
Get-MsolUser -All | Where-Object {$_.IsLicensed -eq $true}
```

### **Get License Assigned to a User**

```powershell
(Get-MsolUser -UserPrincipalName 'user@domain.com').Licenses
```

### **Get License Status for User**

```powershell
(Get-MsolUser -UserPrincipalName 'user@domain.com').Licenses[0].ServiceStatus
```

### **Get License for Users in List**

```powershell
Get-MsolUser | Format-List Displayname,Licenses
```

### **Add License to User**

```powershell
 Set-MsolUserLicense -UserPrincipalName 'user@domain.com' -AddLicenses $LicenseSKU
```

### **Remove License from User**

```powershell
Set-MsolUserLicense -UserPrincipalName 'user@domain.com' -RemoveLicenses $LicenseSKU
```

### **Switch Licenses for a User**

```powershell
Set-MsolUserLicense -UserPrincipalName 'user@domain.com' -AddLicenses $LicenseSKU -RemoveLicenses $LicenseSKU
```

### **User Attributes**

```powershell
Get-MsolUser -UserPrincipalName 'user@domain.com' | Format-List
```

### **List Users**

```powershell
Get-MsolUser
```

### **List Users All**

```powershell
Get-MsolUser -All
```

### **Other MsolUser**

```powershell
Get-MsolUser -All | Where-Object immutableid -eq $null
```

### **Get a list of all cloud only accounts**

```powershell
Get-MsolUser -all | Where-Object immutableid -eq $null |Format-List
```

### **Get all cloud only accounts with all values**

```powershell
Get-MsolUser -all | Where-Object immutableid -ne $null
```

### **Get all synced on-premise accounts (e.g. DirSync, Azure AD Connect, ADFS)**

```powershell
Get-MsolUser -all | Where-Object immutableid -eq $null | Measure-Object
```

### **Show a count of how many cloud only accounts**

```powershell
Get-MsolUser -all | Where-Object immutableid -eq $null | export-csv cloudusers.csv
```

### **Add Users**

```powershell
New-MsolUser -DisplayName 'First Last' -FirstName 'First' -LastName 'Last' -UserPrincipalName 'user@domain.com' -UsageLocation US -LicenseAssignment $LicenseSKU
```

### **Add Users in Bulk**

* Create a CSV:
* 'DisplayName','FirstName','LastName','UsageLocation','AccountSkuId'
* Remaining rows filed with data

```powershell
Import-Csv -Path 'pathtocsv' |
ForEach-Object {
    New-MsolUser -DisplayName $_.DisplayName
                 -FirstName $_.FirstName
                 -LastName $_.LastName
                 -UserPrincipalName $_.UserPrincipalName
                 -UsageLocation $_.UsageLocation
                 -LicenseAssignment $_.AccountSkuId
} | Export-Csv -Path 'PathtoResults\Results.csv' -NoTypeInformation
```

### **Get User Password Policy**

```powershell
Get-MsolUser -UserPrincipalName 'user@domain.com' | Select-Object PasswordNeverExpires

Get-MsolUser | Format-Table DisplayName, PasswordNeverExpires
```

### **Roles**

```powershell
Get-MsolRole
```

### **List Role Members**

```powershell
$role = Get-MsolRole -RoleName 'Company Administrator'

Get-MsolRoleMember -RoleObjectId $role.ObjectId
```

### **Add Role Member**

```powershell
Add-MsolRoleMember -RoleName 'Company Administrator' -RoleMemberEmailAddress 'user@domain.com'
```

### **Remove Role Member**

```powershell
Remove-MsolRoleMember -RoleName 'Company Administrator' -RoleMemberType User -RoleMemberEmailAddress 'user@domain.com'
```
