function ChooseTimeToRun ($Time)
{
    $scheduledTasks = Get-ScheduledTask | Where-Object {$_.TaskNamme -ilike "myTask" }

    if ($scheduledTasks -ne $null){
        Write-Host "Task Already Exists" | Out-String
        DisableAutoRun
    }

    Write-Host "Creating New Task." | Out-String

    $action = New-ScheduledTaskAction -Execute "powershell.exe"
    -argument "-File "c:\Users\champuser\SYS320-01\week7\main.ps1`"
    $trigger = New-ScheduledTaskTrigger -Daily -At $Time
    $principal = New-ScheduledTaskPrincipal -UserId 'champuser' -RunLevel Highest $settings New-ScheduledTaskSettingsSet -RunOnlyIfNetworkAvailable -WakeToRun
    $task = New-ScheduledTask -Action Saction -Principal Sprincipal -Trigger Strigger -Settings $settings
    Register-ScheduledTask 'myTask' -InputObject Stask
    Get-ScheduledTask where-Object { $. TaskName -ilike "myTask" }
}

function DisableAutoRun()
{
    $scheduledTasks = Get-ScheduledTask | Where-Object {$_.TaskName -ilike "myTask"}
    if ($scheduledTasks -ne $null){
        Write-Host "Unregistering task" | Out-String
        Unregister-ScheduledTask -TaskName "myTask" -Confirm: $false

    }
    else{
        Write-Host "Task not registered" | Out-String
    }

}