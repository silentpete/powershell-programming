
$group = Read-Host -Prompt 'What is the group name you want to search for?'

if ($group.Length -eq 0) {
    Write-Output "no group name provided"
} else {
    Get-ADGroupMember $($group) | Sort-Object | Select-Object -Property Name,SamAccountName
}
