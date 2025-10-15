function SendAlertEmail($Body) {
    $From = "connor.english@mymail.champlain.edu"
    $To = "connor.english@mymail.champlain.edu"
    $Subject = "Suspicious Activity"

    $Password = "mosk ahnu uuuc qlvc" | ConvertTo-SecureString -AsPlainText -Force
    $credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $From, $Password

    Send-MailMessage -From $From -To $To -Subject $Subject -Body $Body -SmtpServer "smtp.gmail.com" -Port 587 -UseSsl -Credential $credential
}

SendAlertEmail "Body of Email"