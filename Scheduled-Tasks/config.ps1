cls
$prompt = "Select an option: `n"
$prompt += "1 - Show Configuration `n"
$prompt += "2 - Change Configuration `n"
$prompt += "3 - Exit"

do
{
    Write-Host $prompt
    $choice = Read-Host

    if ($choice -eq 1)
    {
       showConfig
    }

    if ($choice -eq 2)
    {
        changeConfig
    }

}  while ($choice -eq 1 -or $choice -eq 2)


function showConfig()
{
    $configString = Get-Content -Path "C:\Users\cengl\OneDrive\Desktop\config.txt"
    return $configString
}

function changeConfig()
{
    $days = Read-Host "Enter the amount of days check"
    While (-not ($days -match '^\d+$'))
    {
        $days = Read-Host "Enter the amount of days check"
    }


    $time = Read-Host "Enter the time to schedule the email"
    while (-not ($time -match '^(?:[01]\d|2[0-3]):[0-5]\d$'))
    {
        $time = Read-Host "Enter the time to schedule the email"
    }


    $config = [pscustomobject]@{
              "Days" = $days
              "Time" = $time
              }
    $configString = "Days=$days`nTime=$time"

    $configString | Out-File "C:\Users\cengl\OneDrive\Desktop\config.txt"
}
