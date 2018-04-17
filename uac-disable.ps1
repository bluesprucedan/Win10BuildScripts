#Disables UAC: Run all administrator in Admin Approval Mode
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableLUA -PropertyType DWord -Value 0 -Force

#Disables UAC: Detect application installations and prompt for elevation
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableInstallerDetection -PropertyType DWord -Value 0 -Force

#Disables UAC: Only elevate UIAccess applications that are installed in secure locations
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableSecureUIAPaths -PropertyType DWord -Value 0 -Force

#Disables UAC: Switch to the secure desktop when promptin for elevation
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name PromptonSecureDesktop -PropertyType DWord -Value 0 -Force

#Disables UAC: Virtalize file and registry write failures to per-user locations
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\policies\system -Name EnableVirtualization -PropertyType DWord -Value 0 -Force
