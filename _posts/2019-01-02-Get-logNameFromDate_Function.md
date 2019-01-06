---
layout: post
title: "New Function: Get-logNameFromDate"
date: 2019-01-02
tags: [PowerShell,Functions]
---

```powershell
#Requires -Version 3.0
function Get-logNameFromDate {
    <#
.SYNOPSIS
	Generates a log file name for use in other scripts
.DESCRIPTION
	This function simply calculates a file name for the users temp folder
	using the date and time of the function call
	A file is not actually created by this function, only the name to be used by other functions
.PARAMETER Path
    Path to the log file path to be created
.PARAMETER Name
    Name of the log file path to be created
.PARAMETER Extension
    Extension fo the log file path to be created
.EXAMPLE
	PS C:\> Get-logNameFromDate
	C:\Users\username\AppData\Local\Temp\username-20180517-133151.log
.NOTES
	Brian McCarty
#>
    param (
        [string]$name = "$env:username-",
        [string]$stamp = (_DateTimeISO8601),
        [string]$extension = "log"
    )
    $logname = "{0}{1}.{2}" -f $name, $stamp, $extension
    return $logname
}
```

Running the command Get-logNameFeomDate returns the value

```
bmccarty_2019-01-06T12.31.42-08.00.log
```
