---
layout: post
title: "New Function: Get-DateRFC2822"
date: 2019-01-03
tags: [PowerShell,Functions]
---

```powershell
function Get-DateRFC2822() {
    $date = Get-Date
    [string]$date_string = $date.ToUniversalTime().ToString("ddd, dd MMM yyyy HH:mm:ss -0000", `
        ([System.Globalization.CultureInfo]::InvariantCulture))
    return $date_string
}
```

Running the command Get-DateRFC2822 returns the value

```
Sun, 06 Jan 2019 20:26:27 -0000
```