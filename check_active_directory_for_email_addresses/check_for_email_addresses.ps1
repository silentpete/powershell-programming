
<#
SYNOPSIS
Script reads in email addresses and checks for them in a domain.

DESCRIPTION
This script will read in a comma separated list of email addresses, then check the
domain to see if the address is found. If the address is not found, it will let you know.

EXAMPLES
Once you have this code checked out, move into this directory and then run the script.
> .\check_for_email_addresses.ps1

#>

# get the path to the file to read in
$file = Read-Host -Prompt 'what is the relative path to the file with comma separated values to read? [default: .\emails.csv]'
if ($file.Length -eq 0) {
    # if not given one, set default
    $file = ".\emails.csv"
}

# read in the file
$content = Get-Content $file

# split the emails on the comma
$emails = $content.Split(",")

# create a list variable to add not found email addresses
$notfound = @()

# loop over each email and check for it with your logged in account
$emails | ForEach-Object {
    # remove whitespace from variable
    $email = $_ -replace '\s+',''
    $response = Get-ADUser -Filter "EmailAddress -eq '$($email)'"
    # if we did not find the email address in the domain, add to the not found list
    if ($response.length -eq 0) {
        $notfound += $email
    }
}

# if not found list is greater than 0, let the script executor know those addresses
if ($notfound.Length -gt 0) {
    Write-Host "did not find:"
    foreach ($e in $notfound) {
        Write-Host $e
    }
} else {
    Write-Host "found all emails"
}
