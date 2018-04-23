#Creates local admin
$Username = Read-Host -Prompt “Default Local Admin Account in LastPass”

#Changes Password
$Password = Read-Host -Prompt “Password - Default Local Admin Account in LastPass” 

#Adds to Admin group
$group = "Administrators"

#This part I don't really understand yet
$adsi = [ADSI]"WinNT://$env:COMPUTERNAME"
$existing = $adsi.Children | where {$_.SchemaClassName -eq 'user' -and $_.Name -eq $Username }
if ($existing -eq $null) {
    Write-Host "Creating new local user $Username."
    & NET USER $Username $Password /add /y /expires:never

    Write-Host "Adding local user $Username to $group."
    & NET LOCALGROUP $group $Username /add
}
else {
    Write-Host "Setting password for existing local user $Username."
    $existing.SetPassword($Password)
}

#osadmin password never expires
Write-Host "Ensuring password for $Username never expires."
& WMIC USERACCOUNT WHERE "Name='$Username'" SET PasswordExpires=FALSE
