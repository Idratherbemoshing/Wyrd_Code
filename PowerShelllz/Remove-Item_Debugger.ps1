$directoryPath = "C:\Windows\IMECache"

# List all items in the directory
Get-ChildItem -Path $directoryPath -Recurse | ForEach-Object {
    Write-Host "Removing $($_.FullName)"
    try {
        Remove-Item -Path $_.FullName -Force -ErrorAction Stop
    } catch {
        Write-Host "Error removing $($_.FullName): $($_.Exception.Message)" -ForegroundColor Red
    }
}
