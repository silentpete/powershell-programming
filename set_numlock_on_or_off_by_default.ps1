# Can't find out why we have to do this.
# To get the "-Debug" passed argument, we need the next two lines
[CmdletBinding()]
param()

# If we are not in SilentlyContinue, turn on Continue
# With PowerShell prior to 6, we would have to answer a question for each Debug message, this change in v6
if ($DebugPreference -ne "SilentlyContinue") {
    $DebugPreference = 'Continue'
}

# Set the defaults for Num Lock
$numLockOffValue = '0'
Write-Debug ("Num Lock OFF value = $numLockOffValue")
$numLockOnValue = '2'
Write-Debug "Num Lock ON value = $numLockOnValue"

# Get the value of default number lock position
$keyboard = get-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Keyboard' | select-object "InitialKeyboardIndicators"
Write-Debug $keyboard

if ($keyboard.InitialKeyboardIndicators -eq 0) {
    Write-Output "Found that numlock is OFF"
    Write-Output "This means after a reboot, num lock should be OFF and we will have to turn it on to enter our numbers"
    $userInput = Read-Host -Prompt 'Would you like to turn num lock ON by default? [y/n]'
    Write-Debug "received input: $userInput"
    if ($userInput -eq "y") {
        Write-Output "turning num lock ON by default"
        Set-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Keyboard' -Name "InitialKeyboardIndicators" -Value ($numLockOnValue)
    } else {
        Write-Output "Will not turn num lock ON by default"
    }
} else {
    Write-Output "Found num lock is ON"
    Write-Output "This means after a reboot, num lock should be ON and we don't have to turn it on to enter our numbers"
    $userInput = Read-Host -Prompt 'Would you like to turn num lock OFF by default? [y/n]'
    Write-Debug "received input: $userInput"
    if ($userInput -eq "y") {
        Write-Output "turning num lock OFF by default"
        Set-ItemProperty -Path 'Registry::HKU\.DEFAULT\Control Panel\Keyboard' -Name "InitialKeyboardIndicators" -Value ($numLockOffValue)
    } else {
        Write-Output "Will not turn num lock OFF by default"
    }
}
