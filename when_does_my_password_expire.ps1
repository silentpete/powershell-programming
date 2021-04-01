Get-ADUser (basename($env:USERPROFILE)) –Properties "msDS-UserPasswordExpiryTimeComputed" | Select-Object -Property @{Name="Password Expiry Date";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}