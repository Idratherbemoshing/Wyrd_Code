# Using Powershell we can add the Device to Autopilot

New-Item -Type Directory -Path "D:\Work_Scripts\HWID"
Set-Location D:\Work_Scripts\HWID
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
Install-Script -Name Get-WindowsAutopilotInfo -Force
$env:Path += ";C:\Program Files\WindowsPowerShell\Scripts"
Get-WindowsAutopilotInfo -OutputFile AutopilotHWID.csv
