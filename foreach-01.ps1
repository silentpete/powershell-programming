$collection = @(1, 2, 3, 4, 5)
foreach ($i in $collection) {
  Write-Host $i
}

# Or

$collection = @(1..5)
foreach ($i in $collection) {
  Write-Host $i
}

# Or

# strongly typed
[int[]]$collection = @(1..5)
foreach ($i in $collection) {
  Write-Host $i
}
