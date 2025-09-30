function getClasses() {
    $page = Invoke-WebRequest -TimeOutSec 2 http://localhost/Courses2025FA.html

    $trs = $page.ParsedHtml.body.getElementsByTagName("tr")

    $fullTable = @()

    for ($i = 1; $i -lt $trs.Length; $i++) {
        $tds = $trs[$i].getElementsByTagName("td")
        $times = $tds[5].innerText.Split("-")

        $fullTable += [pscustomobject]@{
            "Class Code" = $tds[0].innerText
            "Title"      = $tds[1].innerText
            "Days"       = $tds[4].innerText
            "Start Time" = $times[0]
            "End Time"   = $times[1]
            "Instructor" = $tds[6].innerText
            "Location"   = $tds[9].innerText
        }
    }
    return $fullTable
}

function dayTranslator($fullTable) {
    for ($i = 0; $i -lt $fullTable.Length; $i++) {
        $days = @()

        if ($fullTable[$i].Days -ilike "*M*")  { $days += "Monday" }
        if ($fullTable[$i].Days -ilike "*T[TWF]*")  { $days += "Tuesday" }
        ElseIF ($fullTable[$i].Days -ilike "T"){ $days += "Tuesday" }
        if ($fullTable[$i].Days -ilike "*W*")  { $days += "Wednesday" }
        if ($fullTable[$i].Days -ilike "*TH*") { $days += "Thursday" }
        if ($fullTable[$i].Days -ilike "*F*")  { $days += "Friday" }

        $fullTable[$i].Days = $days
    }
    return $fullTable
}

$table = dayTranslator (getClasses)
#$table | Where-Object { $_.Instructor -eq "Furkan Paligu" } | Format-Table "Class Code", Instructor, Location, Days, "Time Start", "Time End"

#$table | Where-Object {($_.Location -eq "JOYC 310") -and ($_.Days -ilike "Monday" )} | 
#Sort-Object "Start Time" | Format-Table "Class Code", "Start Time", "End Time"


$ITSInstructors = $table |
    Where-Object { $_."Class Code" -like "SYS*" -or
                   $_."Class Code" -like "NET*" -or
                   $_."Class Code" -like "SEC*" -or
                   $_."Class Code" -like "FOR*" -or
                   $_."Class Code" -like "CSI*" -or
                   $_."Class Code" -like "DAT*" } |
    Sort-Object "Instructor"  |
    Select-Object "Instructor" -Unique
    

#$ITSInstructors

$table | Where-Object { $_.Instructor -in $ITSInstructors.Instructor } | Group-Object -Property "Instructor" |
 Sort-Object Count -Descending | Format-Table Count, Name

