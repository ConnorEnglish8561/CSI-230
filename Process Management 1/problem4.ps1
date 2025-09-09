if (Get-Process -Name "chrome"){
    Stop-Process -Name "chrome"
}
else{
   Start-Process -FilePath "chrome.exe" -ArgumentList "https://www.champlain.edu/"
}

