param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][string]$imagePath  # Path to current wallpaper image
)

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$dwordValue = 1 - $daySegment2;

if ( Test-Path $registryPath )
{
    New-ItemProperty -Path $registryPath -Name "AppsUseLightTheme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}
