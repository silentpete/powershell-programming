
<#
SYNOPSIS
Script reads in a file of content, looks for email addresses, and writes them into output.txt.

DESCRIPTION
This script will read in a files contents and look for standard email addresses. The script will
write out the email addresses to an output file.

EXAMPLES
Once you have this code checked out, move into this directory and then run the script.
> .\find_email_addresses_in_file.ps1

#>

# get the path to the file
$file = Read-Host -Prompt 'what is the relative path to the file with email addresses to read? [default: .\input.txt]'
if ($file.Length -eq 0) {
    # set the default if not given one
    $file = ".\input.txt"
}

# read in the file and save to variable
$content = Get-Content $file

# look for and save out all email addresses
$addresses = (Select-String -InputObject $content -Pattern '\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b' -AllMatches).Matches

# save all email addresses into the output.txt file
$addresses.Value | Sort-Object | Get-Unique > output.txt
