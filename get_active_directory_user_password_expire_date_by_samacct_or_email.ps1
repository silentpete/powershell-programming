#
# This little program is used to get the expiration date of a user
# Optional Argument 1 = samAccountName or EmailAddress
#
# Example use case: I would like to check when a users password expires
# $ ./get_active_directory_user_password_expire_date_by_samacct_or_email.ps1
# or
# $ ./get_active_directory_user_password_expire_date_by_samacct_or_email.ps1 username@domain.local
#---

if ($args.Length -gt 0) {
    $userAccount = $args[0]
} else {
    $userAccount = Read-Host -Prompt 'What is the user or email you want to search for?'
}

if ($userAccount.Length -eq 0) {
    Write-Output "no user account provided"
    Exit
}

if ($userAccount.Contains("@")) {
    Get-ADUser -Filter "EmailAddress -eq '$($userAccount)'" –Properties "DisplayName", "msDS-UserPasswordExpiryTimeComputed" | Select-Object -Property "Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}
} else {
    Get-ADUser $userAccount –Properties "DisplayName", "msDS-UserPasswordExpiryTimeComputed" | Select-Object -Property "Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}
}
