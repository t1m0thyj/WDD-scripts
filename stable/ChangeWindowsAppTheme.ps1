param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$dwordValue = If ($nightMode) {0} Elseif ($daysegment4 -ne 1) {1}

if ( Test-Path $registryPath )
{
    New-ItemProperty -Path $registryPath -Name "AppsUseLightTheme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}
