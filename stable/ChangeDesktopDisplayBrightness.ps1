# WARN Requires hardware the supports DDC/CI (the ability to change display brightness in Windows)

param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)

# Edit these values to be a valid screen brightness percent between 0 and 100
$sunriseBrightness = 40
$dayBrightness = 50
$sunsetBrightness = 30
$nightBrightness = 20

if ( $daySegment4 -eq -1 ) {
    $daySegment4 = $daySegment2 * 2 + 1
}

$brightnessPercent = switch ( $daySegment4 )
{
    0 { $sunriseBrightness }
    1 { $dayBrightness }
    2 { $sunsetBrightness }
    3 { $nightBrightness }
}

.\ddccli.exe -b $brightnessPercent