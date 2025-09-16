.(Join-Path $PSScriptRoot  -ChildPath "functions.ps1")
clear

$logTable = GetLogInOut(14)
$logTable

$shutDownTable = GetStartShutdown 25 "Shutdown"
$shutDownTable

$startUpTable = GetStartShutdown 25 "Startup"
$startUpTable