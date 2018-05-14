---
layout: post
title: "PowerShell Comparison Operators"
date: 2018-05-13
tags: [PowerShell]
---

# Comparison Operators

Compare values to conditions:

***

## Operator: ***-eq***

Name: *Equal to*

Description: Use to compare an identical value.

Example

```powershell
Get-ChildItem | Where-Object {$_.Name –eq 'PowerShell notes'}
```

Explanation: *Will find all files where the name of the file is equal to 'PowerShell notes'.*

***

## Operator: ***-ne***

Name: *Not equal to*

Description: Used to compare a different value.

Example

```powershell
Get-ChildItem | Where-Object {$_.Name –ne 'PowerShell notes'}
```

Explanation: *Will find all files where the name is not equal to 'PowerShell notes'.*

***

## Operator: ***-gt***

Name: *Greater than*

Description: Used to compare a different value in size.

Example

```powershell
Get-ChildItem | Where-Object {$_.Length –gt 1MB}
```

Explanation: *Will find all files where the size is greater than 1MB.*

***

## Operator: ***-ge***

Name: *Greater than or equal to*

Description: Used to compare a different or identical value in size.

Example

```powershell
Get-ChildItem | Where-Object {$_.Length –ge 1MB}
```

Explanation: *Will find all files where the size is equal to or greater than 1MB.*

***

## Operator: ***-lt***

Name: *Less than*

Description: Used to compare a different value in size.

Example

```powershell
Get-ChildItem | Where-Object {$_.Length –lt 1MB}
```

Explanation: *Will find all files where the size is less than 1MB.*

***

## Operator: ***-le***

Name: *Less than or equal to*

Description: Used to compare a different or identical value in size.

Example

```powershell
Get-ChildItem | Where-Object {$_.Length –le 1MB}
```

Explanation: *Will find all files where the size is equal to or less
than 1MB.*

***

## Operator: ***-like***

Name: *Like*

Description: Match an identical value using a wildcard character.

Example

```powershell
Get-ChildItem | Where-Object {$_.Name –like 'PowerShell*'}
```

Explanation: *Will find all files where the name begins with 'PowerShell'*.

***

## Operator: ***-notlike***

Name: *Not like*

Description: Does not match an identical value using a wildcard
character.

Example

```powershell
Get-ChildItem | Where-Object {$_.Name –notlike 'PowerShell*'}
```

Explanation: *Will find all files where the name does not begin with 'PowerShell'.*

***

## Operator: ***-match***

Name: *Match*

Description: Used to compare a string using a regular expression.

Example

```powershell
Get-ChildItem | Where-Object {$_.Name –match 'Power'}
```

Explanation: *Will find all files where the name contains 'Power'.*

***

## Operator: ***-notmatch***

Name: *Not match*

Description: Used to compare a string using a regular expression.

Example

```powershell
Get-ChildItem | Where-Object {$_.Name –notmatch 'Power'}
```

Explanation: *Will find all files where the name does not contain 'Power'.*

***

## Operator: ***-contains***

Name: *Contains*

Description: Used to see if all of the objects that are provided
contain a specific value.

Example

```powershell
'Microsoft', 'Windows', 'PowerShell' –contains 'Power'
```

Explanation: *Looks if the string 'Power' is included in all of the provided objects and therefor it will answer 'False' to that question.*

***

## Operator: ***-notcontains***

Name: *Not contains*

Description: Used to see if all of the objects that are provided do not contain a specific value.

Example:

```powershell
'Windows', 'PowerShell' -notcontains 'Power'
```

Explanation: *Looks if the string 'Power' is not included in all of the provided objects and therefor it will answer 'True' to that question.*

***

## Operator: ***-replace***

Name: *Replace*

Description: Used to change the value of an element.

Example

```powershell
Get-ChildItem –include *.doc | Where-Object {$_ –replace '.doc', '.docx'}
```

Explanation: *Will find all *.doc files and changes their extension from .doc to .docx*

##### Content by [The Scripting Dutchman](http://jeffwouters.nl/index.php/2012/03/powershell-conditional-and-comparison-operators-explained/)
