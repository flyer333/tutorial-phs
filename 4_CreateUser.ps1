# Filename:    4_CreateUser.ps1
# Description: Creates a user in Active Directory.  This is part of
#              the Azure AD Connect password hash sync tutorial.
#
# DISCLAIMER:
# Copyright (c) Microsoft Corporation. All rights reserved. This 
# script is made available to you without any express, implied or 
# statutory warranty, not even the implied warranty of 
# merchantability or fitness for a particular purpose, or the 
# warranty of title or non-infringement. The entire risk of the 
# use or the results from the use of this script remains with you.
#
#
#
#
#Declare variables
$Givenname = "Userr"
$Surname = "Name"
$Displayname = "User Name"
$Name = "user1"
$Password = "Pass1word"
$Identity = "CN=user1,CN=Users,DC=tester,DC=es"
$SecureString = ConvertTo-SecureString $Password -AsPlainText -Force


#Create the user
New-ADUser -Name $Name -GivenName $Givenname -Surname $Surname -DisplayName $Displayname -AccountPassword $SecureString

#Set the password to never expire
Set-ADUser -Identity $Identity -PasswordNeverExpires $true -ChangePasswordAtLogon $false -Enabled $true
