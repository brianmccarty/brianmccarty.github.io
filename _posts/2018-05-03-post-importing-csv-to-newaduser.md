---
layout: post
title: "Importing CSV to New-ADUser"
date: 2018-05-04
tags: [PowerShell,Active Driectory]
---

## Importing CSV File to create users in AD

### Create csv file
>samAccountName,Name,Department,City,Title,GivenName,SurName\
>DonJ,DonJ,IT,Las Vegas,CIO,Don,Jones\
>GregS,GregS,Janitorial,Denver,Custodian,Greg,Shields\
>JeffH,JeffH,IT,Syracuse,Technician,Jeffery,Hicks\
>ChrisG,ChrisG,Finance,Las Vegas,Accountant,Christopher,Gannon

```powersehll
Import-csv users.csv | new-aduser
```

If you want to import in a specific OU

```powershell
Import-Csv users.csv | New-ADUser -Path 'ou=sales,dc=company,dc=pri'
```

If the csv isnt formatted correctly

Csv is formatted with invalid column names
>LoginName,Department,City,Title,FirstName,LastName\
>DonJ,IT,Las Vegas,CIO,Don,Jones\
>GregS,Janitorial,Denver,Custodian,Greg,Shields\
>JeffH,IT,Syracuse,Technician,Jeffery,Hicks\
>ChrisG,Finance,Las Vegas,Accountant,Christopher,Gannon

```powershell
Import-Csv .\users2.csv |
    Select-Object *, @{l='samaccountname';e={$_.LoginName}},
	@{l='Name';e={$_.LoginName}},
	@{l='GivenName';e={$_.FirstName}},
	@{l='Surname';e={$_.LastName}} |
    New-AdUser
```

Get computer in particular OU

```powershell
Get-ADComputer -Filter * -SearchBase 'ou=domain controllers,dc=company,dc=pri' | Select-Object -ExpandProperty name
```

Get services from computers in a particular OU

```powershell
Get-service -computername (Get-ADComputer -Filter * -SearchBase 'ou=domain controllers,dc=company,dc=pri' | Select-Object -ExpandProperty name)
```
