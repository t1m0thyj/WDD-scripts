# NOTE: Requires hardware that supports DDC/CI (the ability to change display brightness in Windows)
$event = $Input | ConvertFrom-Json

# Edit these values to be a valid screen brightness percent between 0 and 100
$sunriseBrightness = 40
$dayBrightness = 80
$sunsetBrightness = 30
$nightBrightness = 20

if ($event.daySegment4 -Eq -1) {
    $event.daySegment4 = $event.daySegment2 * 2 + 1
}

$brightnessPercent = switch ($event.daySegment4)
{
    0 { $sunriseBrightness }
    1 { $dayBrightness }
    2 { $sunsetBrightness }
    3 { $nightBrightness }
}

$display = Get-WmiObject -Namespace "root\WMI" -Class "WmiMonitorBrightnessMethods"
$display.WmiSetBrightness(0, $brightnessPercent)
