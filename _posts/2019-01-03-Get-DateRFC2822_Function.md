---
layout: post
title: "New Function: Get-DateRFC2822"
date: 2019-01-03
tags: [PowerShell,Functions,DateTime]
---

```powershell
function Get-DateRFC2822() {
    [string]$date_string = ([System.DateTime]::Now | Get-Date).ToString("ddd, dd MMM yyyy HH:mm:ss zzz", ([System.Globalization.CultureInfo]::InvariantCulture))
    return $date_string
}
```

Running the command Get-DateRFC2822 returns the value

```
Sun, 06 Jan 2019 20:26:27 -0000
```
