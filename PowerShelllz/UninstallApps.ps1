# Function to gather a list of installed programs on the computer from the system's registry.
function Get-InstalledAppsFromRegistry {
    $locations = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
                 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'

    $programs = @()

    foreach ($place in $locations) {
        Get-ChildItem $place | ForEach-Object {
            $programDetails = Get-ItemProperty $_.PsPath
            if ($programDetails.DisplayName) {
                $programs += $programDetails
            }
        }
    }

    return $programs
}

# Show the list of installed programs with a number next to each.
$allPrograms = Get-InstalledAppsFromRegistry
$counter = 1
$allPrograms | ForEach-Object { Write-Host ("{0}. {1}" -f $counter++, $_.DisplayName) }

# Ask the user which programs they want to uninstall.
$userInput = Read-Host "Select programs to uninstall by their numbers, separated by commas (e.g. 1,4,7)"

# Convert the string input into an array of integers.
$selectedIndices = $userInput -split ',' | ForEach-Object { [int]$_ }

# Get the corresponding program names.
$programsToUninstall = $selectedIndices | ForEach-Object { $allPrograms[$_ - 1] }

# Uninstall the selected programs.
foreach ($program in $programsToUninstall) {
    $howToUninstall = $program.UninstallString

    if ($howToUninstall) {
        Write-Host "Removing $($program.DisplayName)..."
        Start-Process cmd.exe -ArgumentList "/c $howToUninstall /quiet" -Wait
        Write-Host "$($program.DisplayName) has been removed."
    } else {
        Write-Host "Sorry, couldn't figure out how to remove $($program.DisplayName). Skipping..."
    }
}

Write-Host "All done!"
