$event = $Input | ConvertFrom-Json

$registryPath = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main"
$dwordValue = If ($event.themeMode -Eq 0) {$event.daySegment2} Else {$event.themeMode - 1}

if (Test-Path $registryPath)
{
    New-ItemProperty -Path $registryPath -Name "Theme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}
