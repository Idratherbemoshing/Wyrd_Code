function Get-InstalledAppsFromRegistry {
    $locations = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
    'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'

    $programs = @()

    foreach ($place in $locations) {
        Get-ChildItem $place | ForEach-Object {
            $programDetails = Get-ItemProperty $_.PsPath
            if ($programDetails.DisplayName) {
                $programs += $programDetails.DisplayName
            }
        }
    }

    return $programs | Sort-Object | Get-Unique
}

$allPrograms = Get-InstalledAppsFromRegistry

$counter = 1
$allPrograms | ForEach-Object {
    Write-Host "$counter. $_"
    $counter++
}

# Show a prompt asking which programs they want to uninstall.
$programsToUninstall = Read-Host "Choose programs by number (e.g. 1,2,3). Separate multiple choices with commas"

$chosenPrograms = $programsToUninstall -split ',' | ForEach-Object { $allPrograms[$_.Trim() - 1] }

foreach ($program in $chosenPrograms) {
    $howToUninstall = (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\* |
        Where-Object { $_.DisplayName -eq $program }).UninstallString

    if ($howToUninstall) {
        Write-Host "Removing $program..."
        Start-Process cmd.exe -ArgumentList "/c $howToUninstall /quiet" -Wait
        Write-Host "$program has been removed."
    }
    else {
        Write-Host "Sorry, I couldn't figure out how to remove $program. Skipping it..."
    }
}

Write-Host "All done!"
