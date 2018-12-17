---
layout: post
title: "Office 365 Mailbox Permissions"
date: 2018-05-23
tags: [PowerShell]
---

# Office 365 Mailbox Permissions

```powershell
Get-Mailbox -ResultSize Unlimited | `
    Add-MailboxPermission -AccessRights FullAccess -User admin@domain.local
```
