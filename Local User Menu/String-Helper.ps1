<# String-Helper
*************************************************************
   This script contains functions that help with String/Match/Search
   operations. 
************************************************************* 
#>


<# ******************************************************
   Functions: Get Matching Lines
   Input:   1) Text with multiple lines  
            2) Keyword
   Output:  1) Array of lines that contain the keyword
********************************************************* #>
function getMatchingLines($contents, $lookline){

$allines = @()
$splitted =  $contents.split([Environment]::NewLine)

for($j=0; $j -lt $splitted.Count; $j++){  
 
   if($splitted[$j].Length -gt 0){  
        if($splitted[$j] -ilike $lookline){ $allines += $splitted[$j] }
   }

}

return $allines
}

function checkPassword($password){
    
    #if the password is less than 6 character, return false
    if ($password.Length -lt 6){
        return $false
        }
    #if the password does not contain a letter, return false
    if ($password -notmatch "[a-zA-z]"){
        return $false
        }
       #if the password does not contain a number, return false
    if ($password -notmatch "[0-9]"){
        return $false
        }
         #if the password does not contain a special character, return false
    if ($password -notmatch "[^a-zA-Z0-9_]"){
        return $false
        }
    Write-Host "asfasf"
    return $true
}