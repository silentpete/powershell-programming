$commands = @(
    "dir"
    "dir ./"
)

$commands | ForEach-Object {
    Invoke-Expression $_
}
