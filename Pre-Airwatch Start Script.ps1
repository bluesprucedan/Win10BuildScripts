
#===============================================================================================
# AUTHOR:  Dan Shepard
# DATE:  4/22/2018
# Version
# COMMENT:
#===============================================================================================

##First of all, make sure there are enough real estate on the powershell console
$BufferWidth = 250
$BufferHeight = 600
$bUpdateSize = $false
$RawUI = (Get-Host).UI.RawUI
$BufferSize = $RawUI.BufferSize

if ($BufferSize.Width -lt $BufferWidth) {$BufferSize.Width = $BufferWidth; $bUpdateSize = $true}
if ($BufferSize.Height -lt $BufferHeight) {$BufferSize.Height = $BufferHeight; $bUpdateSize = $true}
if ($bUpdateSize -eq $true) {$RawUI.BufferSize = $BufferSize}

Remove-Variable bUpdateSize

$ErrorActionPreference = 'Continue'

Write-Host "Pre-Airwatch Deployment"

Write-Host "Local Admin Setup"
.\localadmin.ps1

Write-Host "Power Configuration"
.\powercfg.ps1

Write-Host "Rename computer"
.\systemrename.ps1

Write-Host "Install AirWatchAgent"
.\airwatchdownload.ps1

Write-Host "Disable UAC"
.\uac-disable.ps1

Write-Host "Applying Windows Updates"
.\potentialupdatescript.ps1


Write-Host
Write-Host
Write-Host "System is ready for Airwatch Deployment"
Write-Host
Write-Host
Write-Host "Please confirm Restart"

restart-computer -force -confirm
