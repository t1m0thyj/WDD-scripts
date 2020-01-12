$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$dwordValue = 1 - [int]$args[0];

if ( Test-Path $registryPath )
{
    New-ItemProperty -Path $registryPath -Name "SystemUsesLightTheme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}
