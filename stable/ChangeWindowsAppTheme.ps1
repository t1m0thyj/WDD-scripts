$event = $Input | ConvertFrom-Json

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$dwordValue = 1 - (If ($event.themeMode -Eq 0) {$event.daySegment2} Else {$event.themeMode - 1})

if (Test-Path $registryPath)
{
    New-ItemProperty -Path $registryPath -Name "AppsUseLightTheme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}
