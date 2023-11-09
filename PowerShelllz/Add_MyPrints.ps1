# Create a new PowerShell process with the credentials
function Run-AsAdmin {
    param (
        [string]$installPath,
        [string]$scriptName
    )

    # Get the current script directory (to re-launch this script as admin)
    $currentScript = $MyInvocation.MyCommand.Definition

    # Get the administrator credentials
    $credentials = Get-Credential -Message "Please enter administrator credentials to continue"

    # Get the directory of the .bat path
    $BatPath = "C:\SafeQ\6\FSP_6_65_2\Printer_deployment_scripts"

    # Create a new PowerShell process with the credentials
    Start-Process powershell.exe -Credential $credentials -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$currentScript`" -installPath `"$installPath`" -scriptName `"$scriptName`"" -Wait
}

# Main script starts here
param (
    [string]$installPath = $BatPath,
    [string]$scriptName = "install.bat"
)

# Check if we are running with admin privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Output "Script is not running with administrative privileges. Requesting credentials to run as admin."
    Run-AsAdmin -installPath $installPath -scriptName $scriptName
} else {
    # Now we have admin rights, perform the installation
    if (Test-Path $installPath) {
        # Change directory to the installation path
        Set-Location -Path $installPath
        
        # Run the installation batch file
        Start-Process ".\$scriptName" -Wait

        # Output completion message
        Write-Output "Installation complete. Please set a default printer if required."
    } else {
        Write-Error "Installation path does not exist. Please check the path and try again."
    }
}
