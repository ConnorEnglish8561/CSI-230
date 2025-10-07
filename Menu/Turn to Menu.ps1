clear
. (Join-Path $PSScriptRoot Event-Logs.ps1)
. (Join-Path $PSScriptRoot apache-logs.ps1)
. (Join-Path $PSScriptRoot Process-Management.ps1)


$Prompt = "`n"
$Prompt += "Please choose your operation:`n"
$Prompt += "1 - Display last 10 logs`n"
$Prompt += "2 - Display last 10  failed logins`n"
$Prompt += "3 - Display ar risk users`n"
$Prompt += "4 - Open chrome tab`n"
$Prompt += "5 - Exit"

$operation = $true


do {

    
    Write-Host $Prompt | Out-String
    $choice = Read-Host 


    if ($choice -eq 1){
        ApacheLogs 10
    }

    if ($choice -eq 2){
        getFailedLogins 10
    }

    if ($choice -eq 3){
        getAtRiskUsers 10
    }

    if ($choice -eq 4){
        openToChamplain
    }

} while ($choice -match '[0-4]')