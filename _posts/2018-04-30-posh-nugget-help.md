---
layout: post
title: "PowerShell nuggets - help"
date: 2018-04-30
tags: [PowerShell]
---

`Get-help`

* `Help`


`Get-Command`

* Alias: `gcm`
* Example: `gcm *event*`

Have help launch web browser to help page

```powershell
Help Get-Eventlog -online
```

Get examples for a command

```powershell
Get-Help event-log -examples
```

Get a list of all aliases

```powershell
Get-Alias
```

Get the properties of a cmdlet

```powershell
Get-ADComputer -filter * | Get-Member
```

![Get-ADComputer](/img/2018-04-30-posh-nugget-help-01.png)

Pipelining

```powershell
Get-Process -name b* | Stop-Service
````

What Happened?

1. `Get-Process` returns an object containing all running processes that start with b.
2. `Get-Process | Get-Member` shows that the object being returns has a type of **Process**. Technically **System.Diagnostocs.Process**
3. The `|` between the commands is the **pipeline** character that powershell interperates as a hand off between commands.
4. Looking at the full help for `Stop-Service`. **Name** and **InputObject** parameters are capable of accepting pipeling input by value.
5. Neither **Name** nor **InputObject** can accept Process objects, so **ByValue** parameter binding ceases. The shell will next try **ByPropertyName**.
6. The **Name** parameter is the only one listed as accepting pipeline input **ByPropertyName**.
7. In the example the objects in the pipeline happen to have a **Name** property. PowerShell is able to match between the property **name** and the **-Name** parameter name.
8. The Name properties of the objects sent to the pipeline by `Get-Service` match the process names in the **-Name** parameter of `Stop-Service`.
9. `Stop-Service` will attempt to stop services for each object it recieves.

Parenthesis in powershell

```powershell
Get-Service -computername (Get-Content c:\names.txt)
```
