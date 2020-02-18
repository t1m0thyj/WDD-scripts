# TODO Is there a way to make the theme change take affect immediately when Edge is open?

param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][string]$imagePath  # Path to current wallpaper image
)

$registryPath = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main"
$dwordValue = $daySegment2

if ( Test-Path $registryPath )
{
    New-ItemProperty -Path $registryPath -Name "Theme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}
