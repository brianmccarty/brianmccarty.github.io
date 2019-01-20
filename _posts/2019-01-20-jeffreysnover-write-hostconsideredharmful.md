---
layout: post
title: Jeffrey Snover - Write-Host Considered Harmful
date: 2019-01-20
tags: [PowerShell]
---

## Write-Host Considered Harmful
### Posted on December 7, 2013

When you are writing or reviewing PowerShell scripts, I’d like you to remember the following rule of thumb:

Using Write-Host is almost always wrong.
Write-Host is almost always the wrong thing to do because it interferes with automation.   There are typically two reasons why people use Write-Host:

To convey results.
The problem with using Write-Host to convey results is that they go directly to a display.  That means that they can’t be used by another script to automate a larger task.  Whenever you write a script, you are addressing a particular problem at hand and you are putting a tool in your toolbox that can be used to solve larger problems down the road.  If you use Write-Host to convey results, you have a useless tool in your toolbox.

The correct cmdlet to use is Write-Output.  Using Write-Output will display the results to the screen when you run you script by itself but, it will also allow your script to be used in a pipeline (or foreach loop) and have the results used by other scripts/cmdlets.

To convey comforting information to the user (e.g. “I’m about to do this”).
This is super useful thing to do (I wish more people did more of it) but it is critical that you do it in the write way.  What’s that saying about “the road to hell being paved with good intentions”?  If you use Write-Host to do this, you are paving a road to hell.PowerShell is about automation.  Show comforting information is often helpful the first couple of times you run a script but then after that, it because an annoyance.  When you use Write-Host, the user is not able to say when they want this information and when they don’t.

The correct tool is the Write-Verbose cmdlet.  This cmdlet allows the user to control whether they see the information or not by invoking your script with the -VERBOSE flag or not.Information sent to Write-Host goes directly to a UI with no ability to capture it for a later time.  If you read the About_Redirection help, you’ll see that PowerShell gives you the ability to redirect various streams of information.  The following command will take the output stream of Test-Script and output it to the file o.txt:

```powershell
PS> Test-Script | Out-File o.txt

If Test-Script had verbose information and you did this:

PS> Test-Script -Verbose | Out-File o.txt
```

The verbose stream would go to the screen and the output stream would go to the file.  Using PowerShell redirection, you can “redirect” the verbose stream (referred to as “4” for historical reasons) into the output stream (referred to as “1”) and then both sets of data will be captured into the file:

```powershell
PS> Test-Script -Verbose 4>&1  | Out-File o.txt
```

The syntax is clearly not obvious but it is worth learning (or at least knowing about) because I can guarantee that you’ll have times when this is exactly the thing you need – but, if the script used Write-Host – it won’t work.

So if Write-Host is almost always the wrong thing to use, you might wonder why it is there in the first place.  The answer is in the phrase “almost always”.  I often use Write-Host when I’m writing a throw away script or function.  It is much faster and simpler to use it than to use Write-Verbose and then specify -VERBOSE.  For a throw away script – it doesn’t matter.  The key is to throw it away!  If you don’t intend to throw it away, you shouldn’t use Write-Host.  I always know the scripts I’m going to throw away because they are named T.PS1.

The other scenario to use Write-Host is when you really do want to generate a UX.  Write-Host has a number of nice features like the the ability to colorize text that are great to use when you really do intend to generate a UX.  For example outputting a graph or my personal favorite:

```powershell
PS>  iex (New-Object Net.WebClient).DownloadString(“http://bit.ly/e0Mw9w“)
```

Cheers!
Jeffrey
