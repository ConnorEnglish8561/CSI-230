$path = "$env:USERPROFILE\Downloads\StoppedServices.csv"
Get-Service | Where-Object { $_.Status -eq "Stopped" } | Sort-Object | Export-Csv -Path $path -NoTypeInformation

