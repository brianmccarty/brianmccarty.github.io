---
layout: post
title: "PowerShell nuggets - file management"
date: 2018-05-01
tags: [PowerShell]
---

```powershell
Get-ChildItem -Path C:\temp
```

```powershell
Get-ChildItem -Path C:\temp -Recurse
```

```powershell
Get-ChildItem "c:\windows" > c:\temp\outputfile.txt
```

```powershell
Set-Location -Path C:\Temp
```

```powershell
Move-Item
```

```powershell
Rename-Item
```

```powershell
Rename-Item c:\temp\outputfile.txt c:\temp\MyDir.txt
```

```powershell
Remove-Item
```

```powershell
Remove-Item c:\temp\win*
```

```powershell
Copy-Item
```

```powershell
Copy-Item c:\temp\windowsdir.txt c:\temp\laboutput
```

```powershell
Get-Content
```

```powershell
Get-Content c:\temp\mydir.txt
```

```powershell
New-Item
```

```powershell
New-Item -itemtype directory c:\temp\Laboutput
```

Send output to a file

```powershell
> file.txt
```

Append output to a file

```powershell
>> file.txt
```

Quick creation of csv or txt files

* Open powershell
* Type in `notepad c:\test.csv`
* Powershell prompts to create it
* Notepad is opened and you can create your file and save
