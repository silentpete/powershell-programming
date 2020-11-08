$list = New-Object System.Collections.ArrayList

# supposedly this is faster if working with large arrays
$list.Add("net item") > $null

Write-Host $list
