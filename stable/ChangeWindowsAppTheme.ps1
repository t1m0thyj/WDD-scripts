param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][string]$imagePath, # Path to current wallpaper image
    [Parameter(Mandatory=$true)][bool]$nightMode    # True if night mode is enabled
)

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$dwordValue = If ($nightMode) {0} Else {1 - $daySegment2}

if ( Test-Path $registryPath )
{
    New-ItemProperty -Path $registryPath -Name "AppsUseLightTheme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}
