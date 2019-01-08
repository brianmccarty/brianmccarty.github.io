---
layout: post
title: "New Function: Search-FileContent"
date: 2019-01-07
tags: [PowerShell]
---

# New Function Search-FileContent
```powershell
#Requires -Version 3.0
function Search-FileContent {
<#
.SYNOPSIS
	Generates a listing of files containing search pattern text
.DESCRIPTION
	Generates a listing of files containing search pattern text
.PARAMETER SearchPath
    The base path to be searched
.PARAMETER SearchPattern
    The patterne to be located
.EXAMPLE
	PS C:\> Search-FileContent -searchpath C:\code\brianmccarty -searchpattern "Get-DateISO"

    Name
    ----
    C:\code\brianmccarty\bkmToolKit\docs\Get-DateISO8601.md
    C:\code\brianmccarty\bkmToolKit\Public\DateTime\Get-DateISO8601.ps1
    C:\code\brianmccarty\bkmToolKit\Public\Logging\Get-logNameFromDate.ps1
.NOTES
	Brian McCarty
#>
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory = $true, ValueFromPipeLine = $true)]
        [string]$searchpath,
        [Parameter(Mandatory = $true, ValueFromPipeLine = $true)]
        [string]$searchpattern
    )
    $searchresult = Get-ChildItem -path $searchpath -recurse | `
        Select-String -pattern $searchpattern | `
        group path | `
        select name

    return $searchresult
}
```
