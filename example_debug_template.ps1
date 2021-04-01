# turn regular script into advanced script by adding the cmdletbinding attribute and its required param()
[CmdletBinding()]
Param()

$DebugPreferenceWas = $DebugPreference

# $debugPreference is default to "SilentlyContinue"
# if -debug argument passed, we get "$DebugPreference=Inquire"
if ($DebugPreference -ne "SilentlyContinue" -And $PSVersionTable.PSVersion.Major -lt 6) {
    # note: for backward compatibility set $DebugPreference='Continue'
    #       prior to PowerShell 6, we would have to answer a question for each Debug message, this change in v6
    Write-Output "Backward compatibility, update DebugPreference"
    $DebugPreference = 'Continue'
    Write-Output "DebugPreference was: $DebugPreferenceWas, changed to: $DebugPreference"
}

Write-Debug "this line will only print if -Debug was passed to the script"

Write-Output "script ran, exiting"
