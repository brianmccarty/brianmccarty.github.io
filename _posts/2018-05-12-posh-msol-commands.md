---
layout: post
title: "Microsoft Online Commands"
date: 2018-05-12
tags: [PowerShell, MSOLService]
---

### **List users who a billing contacts**

    $role = Get-MsolRole -RoleName "Company Administrator"
    Get-MsolRoleMember -RoleObjectId $role.ObjectId

### **Update Alternative Address**

    Get-MsolUser -UserPrincipalName user@domain.com | Set-MsolUser -AlternateEmailAddresses altuser@domain.com

### **Change Technical Contact**

    Set-MsolCompanyContactInformation -TechnicalNotificationEmails "user@domain.com"

### **List Licensed Users**

    Get-MsolUser -All | Where-Object {$_.IsLicensed -eq $true}

### **Get License Assigned to a User**

    (Get-MsolUser -UserPrincipalName user@domain.com).Licenses

### **Get License Status for User**

    (Get-MsolUser -UserPrincipalName user@domain.com).Licenses[0].ServiceStatus

### **Get License for Users in List**

    Get-MsolUser | Format-List Displayname,Licenses

### **Add License to User**

    Set-MsolUserLicense -UserPrincipalName user@domain.com -AddLicenses #LicenseSKU

### **Remove License from User**

    Set-MsolUserLicense -UserPrincipalName user@domain.com -RemoveLicenses #LicenseSKU

### **Switch Licenses for a User**

    Set-MsolUserLicense -UserPrincipalName user@domain.com -AddLicenses #LicenseSKU -RemoveLicenses #LicenseSKU

### **User Attributes**

    Get-MsolUser -UserPrincipalName user@domain.com | Format-List

### **List Users**

    Get-MsolUser

### **List Users All**

    Get-MsolUser -All

### **Other MsolUser**

    Get-MsolUser -All | Where-Object immutableid -eq $null

### **Get a list of all cloud only accounts**

    Get-MsolUser -all | Where-Object immutableid -eq $null |Format-List

### **Get all cloud only accounts with all values**

    Get-MsolUser -all | Where-Object immutableid -ne $null

### **Get all synced on-premise accounts (e.g. DirSync, Azure AD Connect, ADFS)**

    Get-MsolUser -all | Where-Object immutableid -eq $null |Measure-Object

### **Show a count of how many cloud only accounts**

    Get-MsolUser -all | Where-Object immutableid -eq $null | export-csv cloudusers.csv

### **Export the list of cloud only accounts to a csv file**

### **Add Users**

    New-MsolUser -DisplayName "First Last" -FirstName First -LastName Last -UserPrincipalName user@domain.com -UsageLocation US -LicenseAssignment #LicenseSKU

### **Add Users in Bulk**

Create a CSV:\
"DisplayName","FirstName","LastName","UsageLocation","AccountSkuId"\
Remaining rows filed with data

    Import-Csv -Path "pathtocsv" |
    ForEach-Object {
        New-MsolUser -DisplayName $_.DisplayName
                     -FirstName $_.FirstName
                     -LastName $_.LastName
                     -UserPrincipalName $_.UserPrincipalName
                     -UsageLocation $_.UsageLocation
                     -LicenseAssignment $_.AccountSkuId
    } | Export-Csv -Path "PathtoResults\Results.csv" -NoTypeInformation

### **Get User Password Policy**

    Get-MsolUser -UserPrincipalName user@domain.com | Select-Object PasswordNeverExpires

    Get-MsolUser | Format-Table DisplayName, PasswordNeverExpires

### **Roles**

    Get-MsolRole

### **List Role Members**

    $role = Get-MsolRole -RoleName "Company Administrator"

    Get-MsolRoleMember -RoleObjectId $role.ObjectId

### **Add Role Member**

    Add-MsolRoleMember -RoleName "Company Administrator" -RoleMemberEmailAddress user@domain.com

### **Remove Role Member**

    Remove-MsolRoleMember -RoleName "Company Administrator" -RoleMemberType User -RoleMemberEmailAddress user@domain.com
