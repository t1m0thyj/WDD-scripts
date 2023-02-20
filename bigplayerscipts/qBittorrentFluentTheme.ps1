param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)

$LightThemePath = "~\AppData\Local\WinDynamicDesktop\scripts\qbittorrenttheme\fluent-light.qbtheme"
$DarkThemePath = "~\AppData\Local\WinDynamicDesktop\scripts\qbittorrenttheme\fluent-dark.qbtheme"
$NightValue = If ($nightMode) {1} Else {$daySegment2}
if ( $NightValue -eq 0)
{
    Copy-Item $LightThemePath "C:\Program Files\qBittorrent\Themes\fluent.qbtheme"
}
else
{
    Copy-Item $DarkThemePath "C:\Program Files\qBittorrent\Themes\fluent.qbtheme"
}
