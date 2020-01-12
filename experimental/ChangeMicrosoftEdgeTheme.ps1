$registryPath = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main"
$dwordValue = [int]$args[0];

if ( Test-Path $registryPath )
{
    New-ItemProperty -Path $registryPath -Name "Theme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}
