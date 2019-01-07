---
layout: post
title: "Find content in files with PowerShell"
date: 2019-01-06
tags: [PowerShell,Search]
---

# Find content in files with PowerShell

Parse through the content of files with powershell to find errors and other troubleshooting information. Linux has grep. With PowerShell, we have Get-Content and Where-Object.

#### Search through a single file for references to the text "ERROR".

```powershell
Get-Content logfile.txt | Where-Object { $_.Contains("ERROR") }
```

#### Count the number of lines containing “ERROR”.

```powershell
@( Get-Content logfile.txt | Where-Object { $_.Contains("ERROR") } ).Count
```

Where-Object will return a string value containing a single match, and an array of lines for multiple matches.

In order for count to count the objects in the array the "@" is needed in the second command to perform count on the objects within the array.
