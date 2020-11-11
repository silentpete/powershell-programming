$somePassedInVariable = " domain.com"

Write-Host "`"$somePassedInVariable`""

# can just output on line without space
Write-Host `"$($somePassedInVariable -replace '\s+','')`"

# can save into self
$somePassedInVariable = $somePassedInVariable -replace '\s+', ''
Write-Host "`"$somePassedInVariable`""
