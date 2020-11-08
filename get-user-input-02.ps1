$x = Read-Host -Prompt 'Would you like to BLAH? [y/n]'

if ($x -eq 'y') {
    Write-Host "you chose y"
} else {
    Write-Host "you chose anything else"
}
