---
layout: post
title: "New Function: Get-DateISO8601"
date: 2019-01-01
tags: [PowerShell,Functions]
---

```powershell
function Get-DateISO8601() {
    [string]$date_string = ([System.DateTime]::Now | `
        Get-Date -Format yyyy-MM-ddTHH.mm.sszzz).ToString() | `
        foreach {$_ -replace ":", "."}
    return $date_string
}
```

Running the command Get-DateISO8601 returns the value

```
2019-01-06T12.17.57-08.00
```
