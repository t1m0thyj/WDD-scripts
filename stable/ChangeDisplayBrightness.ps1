# NOTE: Requires hardware that supports DDC/CI (the ability to change display brightness in Windows)
$params = $Input | ConvertFrom-Json

# Edit these values to be a valid screen brightness percent between 0 and 100
$sunriseBrightness = 40
$dayBrightness = 80
$sunsetBrightness = 30
$nightBrightness = 20

if ($params.daySegment4 -Eq -1) {
    $params.daySegment4 = $params.daySegment2 * 2 + 1
}

$brightnessPercent = switch ($params.daySegment4)
{
    0 { $sunriseBrightness }
    1 { $dayBrightness }
    2 { $sunsetBrightness }
    3 { $nightBrightness }
}

$display = Get-WmiObject -Namespace "root\WMI" -Class "WmiMonitorBrightnessMethods"
$display.WmiSetBrightness(0, $brightnessPercent)
