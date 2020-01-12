$sunriseBrightness = 40
$dayBrightness = 80
$sunsetBrightness = 30
$nightBrightness = 20

$brightnessPercent = switch ( [int]$args[1] )
{
    0 { $sunriseBrightness }
    1 { $dayBrightness }
    2 { $sunsetBrightness }
    3 { $nightBrightness }
}

$display = Get-WmiObject -Namespace "root\WMI" -Class "WmiMonitorBrightnessMethods"
$display.WmiSetBrightness(0, $brightnessPercent)
