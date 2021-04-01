#
# This program is used to get all groups a user is a member of
# Optional Argument 1 = SamAccountName or EmailAddress
#
# Example use case: I would like to see what groups a user is a member of
# $ ./get_active_directory_groups_user_is_member_of.ps1
# or
# $ ./get_active_directory_groups_user_is_member_of.ps1 username@domain.local
#---

if ($args.Length -gt 0) {
    $account = $args[0]
} else {
    $account = Read-Host -Prompt 'What account (login or email) would you like to get groups user is member of?'
}

if ($account.Length -eq 0) {
    Write-Output "no account provided"
} elseif ($account.Contains("@")) {
    Get-ADUser -Filter "EmailAddress -eq '$($account)'" | Get-ADPrincipalGroupMembership | Sort-Object | Select-Object name
} else {
    Get-ADPrincipalGroupMembership ($account) | Sort-Object | Select-Object name
}
