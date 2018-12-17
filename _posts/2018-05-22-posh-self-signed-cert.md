---
layout: post
title: ""
date: 2018-05-13
tags: [PowerShell]
---

# Generate Self-Signed Certificate

```powershell
Set-Location -Path "cert:\LocalMachine\My"
$OldCert = (Get-ChildItem -Path E42DBC3B3F2771990A9B3E35D0C3C422779DACD7)
New-SelfSignedCertificate -CloneCert $OldCert
```
