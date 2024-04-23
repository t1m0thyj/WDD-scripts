$params = $Input | ConvertFrom-Json

$registryPath = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main"
$dwordValue = If ($params.themeMode -Eq 0) {$params.daySegment2} Else {$params.themeMode - 1}

if (Test-Path $registryPath)
{
    New-ItemProperty -Path $registryPath -Name "Theme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}
