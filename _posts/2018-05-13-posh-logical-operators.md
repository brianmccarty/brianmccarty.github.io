---
layout: post
title: "PowerShell Logical Operators"
date: 2018-05-13
tags: [PowerShell]
---

# Logical Operators

Logical operators are used to connect multiple expressions and/or statements to each other. Allowing for one expression to test against multiple conditions:

***

## Operator: ***-and***

Name: *and*

Description: **logical** *and*

*Only true when both statements are true.*

Example

```powershell
Get-ChildItem | Where-Object {($_.Length -gt 1MB) -and ($_.Length -lt 10MB)}
```

Explanation: *Will find all files where the size is between 1MB and 10 MB.*

***

## Operator: ***-or***

Name: *or*

Description: **logical** *or*

*Only true when either or both statements are true.*

Example

```powershell
Get-ChildItem | Where-Object {($_.Name –like “*Microsoft*”) –or ($_.Name –like “*Apple*”)}
```

Explanation: *Will find all files where the name includes either “Microsoft” or “Apple”.*

***

## Operator: *-xor*

Name: Exclusive *or*

Description: **logical** *exclusive or*

*Only true when one of the statements is true and the other is false.*

Example

```powershell
Get-ChildItem | Where-Object {($_.Name –like “*Microsoft*”) –xor ($_.Name –like “*RDS*”)}
```

Explanation: *Will find all files where the name includes “Microsoft” but does not include “RDS”.*

***

## Operator: *-not*

Name: *not*

Description: **logical** *not*

*Negates the statement that follows.*

Example

```powershell
Get-ChildItem | Where-Object {($_.Name –like “*Microsoft*”) –and –not ($_.Length –gt 1MB)}
```

Explanation: *Will find all files where the name includes “Microsoft” and the file is not greater than 1MB.*

***

## Operator: *!*

Name: *not*

Description: *same as operator –not*

Example

```powershell
Get-ChildItem | Where-Object {($_.Name –like “*Microsoft*”) –and !($_.Length –gt 1MB)}
```

Explanation: *same as operator –not*

##### Content by [The Scripting Dutchman](http://jeffwouters.nl/index.php/2012/03/powershell-conditional-and-comparison-operators-explained/)
