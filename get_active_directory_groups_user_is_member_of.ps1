
$account = Read-Host -Prompt 'What is the account you want to search for?'

if ($account.Length -eq 0) {
    Write-Host "no account provided"
} else {
    Get-ADPrincipalGroupMembership ($account) | Sort-Object | Select-Object name
}
