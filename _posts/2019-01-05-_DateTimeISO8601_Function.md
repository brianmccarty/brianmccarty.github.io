---
layout: post
title: "New Function: _DateTimeISO8601"
date: 2019-01-05
tags: [PowerShell,Functions]
---

```powershell
function _DateTimeISO8601() {
    [string]$date_string = ([System.DateTime]::Now | `
        Get-Date -Format yyyy-MM-ddTHH.mm.sszzz).ToString() | `
        foreach {$_ -replace ":", "."}
    return $date_string
}
```

Running the command _DateTimeISO8601 returns the value

```
2019-01-06T12.17.57-08.00
```
