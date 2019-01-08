---
layout: post
title: "Find string in multiple files"
date: 2019-01-07
tags: [PowerShell,Search]
---

# Find string in multiple files


```powershell
Get-ChildItem -path "c:\searchlocaton" -recurse | Select-String -pattern "text to find" | group path | select name
```
