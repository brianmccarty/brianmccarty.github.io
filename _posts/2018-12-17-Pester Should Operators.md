---
layout: post
title: "Pester Should Operators"
date: 2018-12-17
tags: [PowerShell]
---

# Should Operators

Be | Compares one object with another for equality | Case Insensitive
BeExactly | Compares one object with another for equality | Case Sensitive
BeGreaterThan | Asserts that a number is greater than an expected value
BeLessThan | Asserts that a number is less than an expected value
BeLike | Asserts that the actual value matches a wildcard pattern using -like operator | Case Insensitive
BeLikeExactly | Asserts that the actual value matches a wildcard pattern using -like operator | Case Sensitive
BeOfType | Asserts that the actual value be an object of a specified type
Exist | Does not perform any comparison but checks if the object calling Exist is present in a PS Provider
Contain | Checks to see if a file contains the specified text | Case Insensitive
ContainExactly | Checks to see if a file contains the specified text | Case Sensitive
Match | Uses a regular expression to compare two objects | Case Insensitive
MatchExactly | Uses a regular expression to compare two objects | Case Sensitive
Throw | Checks if an exception was thrown in the input ScriptBlock
BeNullOrEmpty | Checks values for null or empty (strings)
