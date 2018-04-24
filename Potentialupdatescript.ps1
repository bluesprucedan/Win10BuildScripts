Install-Module PSWindowsUpdate
Get-Command -Module PSWindowsUpdate
Install-WindowsUpdate -Install -AcceptAll -MicrosoftUpdate -Autoreboot
