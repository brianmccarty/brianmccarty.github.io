---
layout: post
title: "PowerShell nuggets - misc stuff"
date: 2018-05-02
tags: [PowerShell]
---
## Quick PowerShell nuggets that should be second nature

* `Get-Service` display a list of services
* `Get-Process` display a list of running processes
* `Get-Eventlog` displays contents of event log
* `New-Service` Create a new service
* `Test-Connection` Ping type utility
* `Test-NetConnection` Better network ping and port utility

### Find out where the PowerShell Modules live

```powershell
Get-Content env:psmodulepath
```

### List available powershell modules

```powershell
Get-Module -listavailable
```

### List currently loaded modules

```powershell
Get-Module
```

### Import-modules

```powershell
Import-Module <MODULENAME>
```

### Get commands for a specific module

```powershell
Get-Command -module servermanager
```

### Get the application log for all computers in the names.txt file

```powershell
Get-Eventlog -logtype application -computer (Get-Content names.txt)
```

### Sorting output by an attribute in descending order

```powershell
Get-Process | Sort-Object -property vm
Get-Process | Sort-Object vm -descending
Get-Process | Sort-Object vm,id -desc
```

### Get information and output to html file

```powershell
Get-Process | Select-Object name,vm,id,pm | ConvertTo-Html | Out-File test1.html
```
