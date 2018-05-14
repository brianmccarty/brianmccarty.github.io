---
layout: post
title: "PowerShell nuggets"
date: 2018-05-14
tags: [PowerShell]
---
# Quick PowerShell nuggets that should be second nature

* `Get-Service` display a list of services
* `Get-Process` display a list of running processes
* `Get-Eventlog` displays contents of event log
* `New-Service` Create a new service
* `Test-Connection` Ping type utility
* `Test-NetConnection` Better network ping and port utility

## Find out where the PowerShell Modules live

```powershell
Get-content env:psmodulepath
```

## List available powershell modules

```powershell
Get-module -listavailable
```

## List currently loaded modules

```powershell
Get-module
```

## Import-modules

```powershell
Import-module MODULENAME
```

## Get commands for a specific module

```powershell
Get-command -module servermanager
```

## Get the application log for all computers in the names.txt file

```powershell
Get-eventlog -logtype application -computer (get-content names.txt)
```

## Sorting output by an attribute in descending order

```powershell
Get-process | sort-object -property VM
Get-process | sort vm -descending
Get-process | sort vm,id -desc
```

## Get information and output to html file

```powershell
Get-process | select name,vm,id,pm | convertto-html | out-file test1.html
```
