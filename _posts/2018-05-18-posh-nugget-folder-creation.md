---
layout: post
title: "Create a folder with PowerShell commands"
date: 2018-05-13
tags: [PowerShell]
---

# Simplly create a folder using PowerShell

Instead of the commong mkdir using PowerShell allows for all the benefits that come with working with objects.
Verbose, error handling, using varabiles etc.

```powershell
New-Item -ItemType directory -Path C:\Scripts\newDir
```
