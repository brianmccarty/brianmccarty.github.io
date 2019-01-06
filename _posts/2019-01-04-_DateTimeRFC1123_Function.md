---
layout: post
title: "New Function: _DateTimeRFC1123"
date: 2019-01-04
tags: [PowerShell,Functions]
---

```powershell
function _DateTimeRFC1123() {
    [string]$date_string = ([System.DateTime]::UtcNow | Get-Date -Format R).ToString()
    return $date_string
}
```

Running the command _DateTimeISO8601 returns the value

```
Sun, 06 Jan 2019 20:27:41 GMT
```
