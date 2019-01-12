---
layout: post
title: ShouldProcess
date: 2019-01-11
tags: [PowerShell]
---

# Use ShouldProcess in PowerShell Functions

ShouldProcess asks for confirmation.

An advanced function is created by adding [CmdletBinding()] to the top of the function. ShouldProcess is enabled by adding a parameter:

```powershell
function Test-ShouldProcess {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param()

    # Code
}
```
By adding ConfirmImpact, you can specify when a function asks for confirmation. When using verbs like New or Remove, the PowerShell script analyzer forces you to add the expected impact on the environment to your function. Based on this impact definition and the setting of $ConfirmPreference, PowerShell will decide whether to ask for confirmation. Whenever the impact is higher than the $ConfirmPreference, a confirmation is required.

The function will most certainly not contain critical code exclusively. Usually functions with an impact require some preparation and cleaning up afterwards. You can easily wrap the critical code to make sure that the confirmation is only required to execute the wrapped code. The critical code should only be called if some preparation fails. You do not want to ask for confirmation without requiring it. The method $PSCmdlet.ShouldProcess() takes care of this:

```powershell
function Test-ShouldProcess {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param()

    # Preparation

    if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
        # Critical code
    }

    # Cleanup
}
```

The ShouldProcess method has multiple overloads to cover different several use cases regarding messaging towards to end-user.

The above example will already work for the following scenarios:

Using different values for ConfirmImpact and $ConfirmPreference
Using $WhatIfPreference
Using the parameter -WhatIf to test the outcome
Using the parameter -Confirm to confirm non-interactively
When such a function is used as part of a library or module, it is seldomly called directly but it part of a much larger call stack. If Test-ShouldProcess is called from a function which is called with -WhatIf it is highly desirable to honour this further down in the call stack. This requires reading the state of variables like $WhatIfPreference and $ConfirmPreference from the session instead of simply relying on the parameters passed to Test-ShouldProcess:

```powershell
function Test-ShouldProcess {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]
    param()

    Begin {
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }
    }

    Process {
        # Preparation

        if ($PSCmdlet.ShouldProcess("ShouldProcess?")) {
            # Critical code
        }

        # Cleanup
    }
}
```

Of course, the same works for honouring $VerbosePreference.

Code
The full example can be viewed, copied and reused:

```powershell
Function New-Something {}

Function Test-ShouldProcess {
    [CmdletBinding(SupportsShouldProcess, ConfirmImpact='Medium')]

    Param(
        [Parameter()]
        [switch]
        $Force
    )

    Begin {
        if (-not $PSBoundParameters.ContainsKey('Verbose')) {
            $VerbosePreference = $PSCmdlet.SessionState.PSVariable.GetValue('VerbosePreference')
        }
        if (-not $PSBoundParameters.ContainsKey('Confirm')) {
            $ConfirmPreference = $PSCmdlet.SessionState.PSVariable.GetValue('ConfirmPreference')
        }
        if (-not $PSBoundParameters.ContainsKey('WhatIf')) {
            $WhatIfPreference = $PSCmdlet.SessionState.PSVariable.GetValue('WhatIfPreference')
        }
        Write-Verbose ('[{0}] Confirm={1} ConfirmPreference={2} WhatIf={3} WhatIfPreference={4}' -f $MyInvocation.MyCommand, $Confirm, $ConfirmPreference, $WhatIf, $WhatIfPreference)
    }

    Process {
        <# Pre-impact code #>

        # -Confirm --> $ConfirmPreference = 'Low'
        # ShouldProcess intercepts WhatIf* --> no need to pass it on
        if ($Force -or $PSCmdlet.ShouldProcess("ShouldProcess?")) {
            Write-Verbose ('[{0}] Reached command' -f $MyInvocation.MyCommand)
            # Variable scope ensures that parent session remains unchanged
            $ConfirmPreference = 'None'
            New-Something
        }

        <# Post-impact code #>
    }

    End {
        Write-Verbose ('[{0}] Confirm={1} ConfirmPreference={2} WhatIf={3} WhatIfPreference={4}' -f $MyInvocation.MyCommand, $Confirm, $ConfirmPreference, $WhatIf, $WhatIfPreference)
    }
}

Describe 'ShouldProcess' {
    Mock New-Something {}
    It 'Should process by default' {
        Test-ShouldProcess
        Assert-MockCalled New-Something -Scope It -Exactly -Times 1
    }
    It 'Should not process on explicit request for confirmation (-Confirm)' {
        { Test-ShouldProcess -Confirm }
        Assert-MockCalled New-Something -Scope It -Exactly -Times 0
    }
    It 'Should not process on implicit request for confirmation (ConfirmPreference)' {
        {
            $ConfirmPreference = 'Medium'
            Test-ShouldProcess
        }
        Assert-MockCalled New-Something -Scope It -Exactly -Times 0
    }
    It 'Should not process on explicit request for validation (-WhatIf)' {
        { Test-ShouldProcess -WhatIf }
        Assert-MockCalled New-Something -Scope It -Exactly -Times 0
    }
    It 'Should not process on implicit request for validation (WhatIfPreference)' {
        {
            $WhatIfPreference = $true
            Test-ShouldProcess
        }
        Assert-MockCalled New-Something -Scope It -Exactly -Times 0
    }
    It 'Should process on force' {
        $ConfirmPreference = 'Medium'
        Test-ShouldProcess -Force
        Assert-MockCalled New-Something -Scope It -Exactly -Times 1
    }
}
```
