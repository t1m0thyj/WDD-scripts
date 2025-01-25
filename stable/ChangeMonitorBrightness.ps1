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

$brightnessPercent = switch ($params.daySegment4) {
    0 { $sunriseBrightness }
    1 { $dayBrightness }
    2 { $sunsetBrightness }
    3 { $nightBrightness }
}

$ddc_app = '.\ddccli.exe'

# Checks if the required DCC utility is present, if not then downloads it from the source.
if (-Not (Test-Path -Path $ddc_app)) {
    Invoke-WebRequest -Uri 'https://github.com/hensm/ddccli/releases/download/v0.0.2/ddccli.exe' -OutFile $ddc_app
}

Start-Process -FilePath $ddc_app -ArgumentList "-b $brightnessPercent" -NoNewWindow
