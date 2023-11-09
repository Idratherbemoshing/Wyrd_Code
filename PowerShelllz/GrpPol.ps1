# List all GPOs and their settings
Get-GPO -All | ForEach-Object {
    $GPO = $_
    $GPOReport = Get-GPOReport -Name $GPO.DisplayName -ReportType HTML
    Write-Output "GPO Name: $($GPO.DisplayName)"
    Write-Output "GPO Settings:"
    $GPOReport | Select-String -Pattern "<q:SettingName>(.*?)<\/q:SettingName>" | ForEach-Object {
        $SettingName = $_.Matches.Groups[1].Value
        Write-Output "  $SettingName"
    }
}

# Clear a specific registry-based GPO setting
$GPOName = "YourGPOName"
$RegistryKey = "HKLM\Software\Policies\YourPolicyKey"
$ValueName = "YourValueName"

# Remove the registry value
Remove-ItemProperty -Path $RegistryKey -Name $ValueName

# Refresh Group Policy
gpupdate /force
 