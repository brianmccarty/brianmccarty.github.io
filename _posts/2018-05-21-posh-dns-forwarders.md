---
layout: post
title: "PowerShell DNS Forwarders"
date: 2018-05-21
tags: [PowerShell]
---

# POSH DNS Forwarders

## View DNS forwarders

### View the DNS forwarders on the local system

```powershell
Get-DnsServerForwarder
```

### View from all domain controllers

```powershell
Get-ADDomainController -Filter * | ForEach-Object {
	Get-DnsServerForwarder -ComputerName $_.name
}
```

## Replace forwarders

To **REPLACE** all the DNS forwarders on the local system

```powershell
Set-DnsServerForwarder -IPAddress 208.67.222.222, 208.67.220.220
```

To **REPLACE ALL** the DNS forwarders for all domain controllers

```powershell
Get-ADDomainController -Filter * | ForEach-Object {
	Set-DnsServerForwarder -Computername $_.name -IPAddress 208.67.222.222, 208.67.220.220
}
```

## Add forwarders

To **ADD** additional DNS forwarders on the local system:

```powershell
Add-DnsServerForwarder -IPAddress 208.67.222.222, 208.67.220.220
```

To **ADD** additional DNS forwarders for all domain controllers

```powershell
Get-ADDomainController -Filter * | ForEach-Object {
	Add-DnsServerForwarder -Computername $_.name -IPAddress 208.67.222.222, 208.67.220.220
}
```
