clear


function challenge1(){

    $page = Invoke-WebRequest -TimeoutSec 2 http://localhost/IOC-1.html
    $trs = $page.ParsedHtml.body.GetElementsByTagName("tr")

    $fullTable = @()

    for ($i = 1; $i -lt $trs.Length; $i++) {
        $tds = $trs[$i].getElementsByTagName("td")
        $pattern = $tds[0].innerText
        $explaination = $tds[1].innerText

        $fullTable += [pscustomobject]@{
                                 "Pattern" = $pattern
                                 "Explaination" = $explaination     
                                 }
    }

    $fullTable | Format-Table -AutoSize
}

function challenge2(){
    $notFormatted = Get-Content -Path C:\xampp\apache\logs\access.log
    $fullTable = @()

     for ($i=0; $i -lt $notFormatted.Count; $i++)
    {
        $words = $notFormatted[$i].Split(" ");

        $fullTable += [pscustomobject]@{ "IP" = $words[0];  
                                            "Time" =$words[3].Trim('[');
                                            "Method" = $words[5].Trim('"')
                                            "Page" = $words[6];
                                            "Protocall" = $words[7];
                                            "Response" = $words[8];
                                            "Referer" = $words[10];
                                             }
        
                                        

    }
    $fullTable | Format-Table -AutoSize
}

function challenge3(){

 $notFormatted = Get-Content -Path C:\xampp\apache\logs\access.log
    $fullTable = @()

     for ($i=0; $i -lt $notFormatted.Count; $i++)
    {
        $words = $notFormatted[$i].Split(" ");

        $log = [pscustomobject]@{ "IP" = $words[0];  
                                            "Time" =$words[3].Trim('[');
                                            "Method" = $words[5].Trim('"')
                                            "Page" = $words[6];
                                            "Protocall" = $words[7];
                                            "Response" = $words[8];
                                            "Referer" = $words[10];
                                             }
    if ($log.Response -eq 200){
        $fullTable += $log
        
    }
                                        

    }
    $fullTable | Format-Table -AutoSize



}

#challenge1
#challenge2
challenge3


