$stringArray = @(
    "one"
    "two"
    "three"
    "three"
)

$stringArray

Write-Host "now only unique"

$stringArray | Sort-Object | Select-Object -Unique

$uniques = @()
$duplicates = @(
    "three"
    "one"
    "two"
    "three"
    "three"
    "one"
)

$duplicates | ForEach-Object {
    if (!$uniques.Contains($_)) {
        $uniques += $_
    }
}

Write-Host "the duplicates:"
$duplicates
Write-Host "the uniques:"
$uniques
