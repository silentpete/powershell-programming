
$email = Read-Host -Prompt 'What is the email address you want to search for?'

if ($email.Length -eq 0) {
    Write-Host "no email address provided"
} else {
    Get-ADUser -Filter "EmailAddress -eq '$($email)'"
}
