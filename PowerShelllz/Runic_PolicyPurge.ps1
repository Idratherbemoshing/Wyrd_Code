# Function to remove a specific policy from the registry
Write-Host @'
__________             .__      __________      .__  .__              __________                            
\______   \__ __  ____ |__| ____\______   \____ |  | |__| ____ ___.__.\______   \__ _________  ____   ____  
 |       _/  |  \/    \|  |/ ___\|     ___/  _ \|  | |  |/ ___<   |  | |     ___/  |  \_  __ \/ ___\_/ __ \ 
 |    |   \  |  /   |  \  \  \___|    |  (  <_> )  |_|  \  \___\___  | |    |   |  |  /|  | \/ /_/  >  ___/ 
 |____|_  /____/|___|  /__|\___  >____|   \____/|____/__|\___  > ____| |____|   |____/ |__|  \___  / \___  >
        \/           \/        \/                            \/\/                           /_____/      \/ 
'@
        
function Remove-Policy {
    param(
        [string]$PolicyPath
    )
    
    try {
        Remove-ItemProperty -Path $PolicyPath -Name $PolicyName -ErrorAction Stop
        Write-Host "Removed policy: $PolicyPath\$PolicyName"
    }
    catch {
        Write-Host "Failed to remove policy: $PolicyPath\$PolicyName"
        Write-Host "Error: $_"
    }
}

# Specify the Registry keys for system and user policies
$SystemPolicyKey = "HKLM\Software\Policies"
$UserPolicyKey = "HKCU\Software\Policies"

# Prompt the user for the target location (system or user)
$TargetLocation = Read-Host "Enter 'S' for System Policies or 'U' for User Policies"

if ($TargetLocation -eq 'S' -or $TargetLocation -eq 's') {
    $PolicyKey = $SystemPolicyKey
    Write-Host "Selected target location: System Policies ($SystemPolicyKey)"
}
elseif ($TargetLocation -eq 'U' -or $TargetLocation -eq 'u') {
    $PolicyKey = $UserPolicyKey
    Write-Host "Selected target location: User Policies ($UserPolicyKey)"
}
else {
    Write-Host "Invalid input. Exiting script."
    exit
}

# List available policy subkeys
Write-Host "Available Policy Subkeys under $PolicyKey{}:"
$PolicySubkeys = Get-Item -Path $PolicyKey | Get-ItemProperty
if ($PolicySubkeys.Count -eq 0) {
    Write-Host "No policy subkeys found."
}
else {
    $PolicySubkeys | ForEach-Object {
        Write-Host "  $($_.Name)"
    }
}

# Prompt the user for the policy subkey to work with
$SelectedPolicySubkey = Read-Host "Enter the name of the policy subkey to work with"

# List policies under the selected subkey
Write-Host "Available Policies under $PolicyKey\$SelectedPolicySubkey{}:"
$PolicyPath = "$PolicyKey\$SelectedPolicySubkey"
$Policies = Get-Item -Path $PolicyPath | Get-ItemProperty
if ($Policies.Count -eq 0) {
    Write-Host "No policies found under $PolicyPath."
}
else {
    $Policies | ForEach-Object {
        Write-Host "  $($_.Name)"
    }
}

# Prompt the user for the policy name to remove
$PolicyName = Read-Host "Enter the name of the policy to remove"

# Remove the specified policy
Remove-Policy -PolicyPath $PolicyPath
