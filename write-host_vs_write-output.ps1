$someObject = get-aduser (basename($env:USERPROFILE))

Write-Host $someObject

Write-Output $someObject
