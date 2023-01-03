if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$exePath = (Get-Process -Name WinDynamicDesktop).Path
if (!$exePath) {
    Add-Type -AssemblyName PresentationCore,PresentationFramework
    [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
    [System.Windows.MessageBox]::Show("WinDynamicDesktop must be running in order to use this script.", "Error")
    exit
}

$taskAction = New-ScheduledTaskAction -Execute $exePath
$taskSettings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
$taskTrigger = New-ScheduledTaskTrigger -AtLogOn
Register-ScheduledTask -TaskName WinDynamicDesktop -Action $taskAction -Description "Start WinDynamicDesktop at logon" -Settings $taskSettings -Trigger $taskTrigger

Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Windows.MessageBox]::Show("Scheduled task created successfully.", "WinDynamicDesktop")
