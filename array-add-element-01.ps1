$list = @()

# supposedly this will create a new array object, so this way will take more time if large array
$list += "new item"

Write-Host $list
