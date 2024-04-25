$params = $Input | ConvertFrom-Json

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$dwordValue = 1 - $(If ($params.themeMode -Eq 0) {$params.daySegment2} Else {$params.themeMode - 1})

if (Test-Path $registryPath)
{
    New-ItemProperty -Path $registryPath -Name "AppsUseLightTheme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}
