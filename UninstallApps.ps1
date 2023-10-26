function Get-InstalledAppsFromRegistry {
    $uninstallKeys = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall',
                     'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall'

    $appList = @()
    foreach ($key in $uninstallKeys) {
        Get-ChildItem $key | ForEach-Object {
            $appProperties = Get-ItemProperty $_.PsPath
            if ($appProperties.DisplayName) {
                $appList += $appProperties.DisplayName
            }
        }
    }
    return $appList | Sort-Object | Get-Unique
}

function Select-AppsForUninstall {
    param ([string[]]$appList)

    $index = 1
    foreach ($app in $appList) {
        Write-Host "$index. $app"
        $index++
    }

    $selectedIndexes = Read-Host "Enter the numbers of the applications you want to uninstall (comma separated)"
    return $selectedIndexes.Split(',').Trim() | ForEach-Object { $appList[[int]$_ - 1] }
}

# Main script
$apps = Get-InstalledAppsFromRegistry
$appsToUninstall = Select-AppsForUninstall -appList $apps

Write-Host "You've chosen to uninstall the following applications:"
$appsToUninstall | ForEach-Object { Write-Host $_ }
$confirmation = Read-Host "Are you sure? (Y/N)"
if ($confirmation -eq 'Y') {
    foreach ($appName in $appsToUninstall) {
        try {
            $app = Get-WmiObject -Class Win32_Product | Where-Object { $_.Name -eq $appName }
            if ($app) {
                $app.Uninstall()
                Write-Host "$appName uninstalled successfully." -ForegroundColor Green
            } else {
                Write-Host "Failed to uninstall $appName." -ForegroundColor Red
            }
        } catch {
            Write-Host "Error uninstalling $appName. $_" -ForegroundColor Red
        }
    }
}
