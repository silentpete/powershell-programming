#
# This little program is used to get all users in a group, then print out a property.
# Optional Argument 1 = group
# Optional Argument 2 = property
#
# Example use case: I would like to know all users in application_x_users samaccountname attribute
# $ ./check_active_directory_group_members_property.ps1 group property
#---

if ($args.Length -gt 0) {
    $group = $args[0]
} else {
    $group = Read-Host -Prompt 'What is the group name you want to search for?'
}

if ($args.Length -gt 1) {
    $propertyName = $args[1]
} else {
    $propertyName = Read-Host -Prompt 'What is the Property name you want to search for?'
}

if ($group.Length -eq 0) {
    Write-Output "no group name provided"
    Exit
} elseif ($propertyName.Length -eq 0) {
    Write-Output "no property name provided"
    Exit
} else {
    $groupMembers = Get-ADGroupMember $($group) | Sort-Object
}

$userProperty = @{}

foreach ($member in $groupMembers) {
    $propertyValue = get-aduser $member -properties * | Select-Object -property $propertyName,"EmailAddress"
    $userProperty.Add($member.SamAccountName, $propertyValue)
    # for testing, if you only want to print out one member, uncomment the Write-Output and Exit so only one loop happens and prints
    # Write-Output $member, $propertyValue
    # Exit
}

Write-Output "Found the following users in Group: $group, with property: $propertyName value"
foreach ($up in $userProperty) {
    Write-Output $up.Values
}
