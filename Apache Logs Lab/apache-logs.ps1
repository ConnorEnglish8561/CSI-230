function ApacheLogs(){
    $logsNotFormatted = Get-Content -Path C:\xampp\apache\logs\access.log
    $tableRecords = @()

    for ($i=0; $i -lt $logsNotFormatted.Count; $i++)
    {
        $words = $logsNotFormatted[$i].Split(" ");

        $tableRecords += [pscustomobject]@{ "IP" = $words[0];  
                                            "Time" =$words[3].Trim('[');
                                            "Method" = $words[5].Trim('"')
                                            "Page" = $words[6];
                                            "Protocall" = $words[7];
                                            "Response" = $words[8];
                                            "Referer" = $words[10];
                                            "Client" = $words[11..($words.Count - 1)]-join ' '
                                             }
        
                                        
    }
    return $tableRecords | Where-Object {$_.IP-ilike "10.*"}
}

$tableRecords = ApacheLogs
$tableRecords | Format-Table -AutoSize -Wrap

$tableRecords = ApacheLogs
$tableRecords | Format-Table -AutoSize -Wrap
