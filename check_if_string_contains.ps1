$someString = Read-Host -Prompt 'please give me some text to work with?'
$someCharacter = Read-Host -Prompt 'please give me a character?'


if ($someString.Contains($someCharacter)) {
    Write-Output "found '$someCharacter' in: $someString"
} else {
    Write-Output "did not find '$someCharacter' in: $someString"
}
