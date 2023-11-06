# Fetch the current DNS suffixes
$CurrentSuffixes = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name SearchList | Select-Object -ExpandProperty SearchList

# Split the suffixes into an array
$SuffixArray = $CurrentSuffixes -split ","

# Remove the desired suffix
$SuffixToRemove = "your_dns_suffix"
$ModifiedArray = $SuffixArray | Where-Object { $_ -ne $SuffixToRemove }

# Join the modified array back into a string
$NewSuffixes = $ModifiedArray -join ","

# Update the registry with the modified list
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -Name SearchList -Value $NewSuffixes
