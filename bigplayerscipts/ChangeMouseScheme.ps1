param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)

# Define file paths for the xml files
$nightValueFilePath = "~\AppData\Local\WinDynamicDesktop\scripts\globalScripts\NightValue.xml"
$startValueFilePath = "~\AppData\Local\WinDynamicDesktop\scripts\globalScripts\StartValue.xml"

# Import the previous night value and start value from their xml files
$previousNightValue = Import-CliXml $nightValueFilePath
$startValue = Import-CliXml $startValueFilePath

# Determine the current night value based on whether the system is in night mode
$nightValue = if ($nightMode) {
    1 # If the system is in night mode, set nightValue to 1
} else {
    $daySegment2 # Otherwise, set it to the value of $daySegment2
}


if ( ($NightValue -eq 0 -and $StartValue -eq 1) -or ($NightValue -ne $PreviousNightValue -and $StartValue -eq 0 -and $NightValue -eq 0))
{
$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]"CurrentUser","$env:COMPUTERNAME")
$RegCursors = $RegConnect.OpenSubKey("Control Panel\Cursors",$true)
$RegCursors.SetValue("","W11 Cursor Light HD v2.2 by Jepri Creations")
$RegCursors.SetValue("AppStarting","%SYSTEMROOT%\Cursors\W11_light_v2.2\working.ani")
$RegCursors.SetValue("Arrow","%SYSTEMROOT%\Cursors\W11_light_v2.2\pointer.cur")
$RegCursors.SetValue("Crosshair","%SYSTEMROOT%\Cursors\W11_light_v2.2\precision.cur")
$RegCursors.SetValue("Hand","%SYSTEMROOT%\Cursors\W11_light_v2.2\link.cur")
$RegCursors.SetValue("Help","%SYSTEMROOT%\Cursors\W11_light_v2.2\help.cur")
$RegCursors.SetValue("IBeam","%SYSTEMROOT%\Cursors\W11_light_v2.2\beam.cur")
$RegCursors.SetValue("No","%SYSTEMROOT%\Cursors\W11_light_v2.2\unavailable.cur")
$RegCursors.SetValue("NWPen","%SYSTEMROOT%\Cursors\W11_light_v2.2\handwriting.cur")
$RegCursors.SetValue("Person","%SYSTEMROOT%\Cursors\W11_light_v2.2\person.cur")
$RegCursors.SetValue("Pin","%SYSTEMROOT%\Cursors\W11_light_v2.2\pin.cur")
$RegCursors.SetValue("precisionhair","%SYSTEMROOT%\Cursors\W11_dark_v2.2\precision.cur")
$RegCursors.SetValue("SizeAll","%SYSTEMROOT%\Cursors\W11_light_v2.2\move.cur")
$RegCursors.SetValue("SizeNESW","%SYSTEMROOT%\Cursors\W11_light_v2.2\dgn2.cur")
$RegCursors.SetValue("SizeNS","%SYSTEMROOT%\Cursors\W11_light_v2.2\vert.cur")
$RegCursors.SetValue("SizeNWSE","%SYSTEMROOT%\Cursors\W11_light_v2.2\dgn1.cur")
$RegCursors.SetValue("SizeWE","%SYSTEMROOT%\Cursors\W11_light_v2.2\horz.cur")
$RegCursors.SetValue("UpArrow","%SYSTEMROOT%\Cursors\W11_light_v2.2\alternate.cur")
$RegCursors.SetValue("Wait","%SYSTEMROOT%\Cursors\W11_light_v2.2\busy.ani")
$RegCursors.Close()
$RegConnect.Close()

Add-Type @"
using System.Runtime.InteropServices;
public class WinAPI {
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo", SetLastError = true)]
public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, string pvParam, uint fWinIni);
}
"@
[WinAPI]::SystemParametersInfo(0x0057, 0, $null, 0)

}


ElseIf (($NightValue -eq 1 -and $StartValue -eq 1) -or ($NightValue -ne $PreviousNightValue -and $StartValue -eq 0 -and $NightValue -eq 1))
{
$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]"CurrentUser","$env:COMPUTERNAME")
$RegCursors = $RegConnect.OpenSubKey("Control Panel\Cursors",$true)
$RegCursors.SetValue("","W11 Cursors Dark HD v2.2 by Jepri Creations")
$RegCursors.SetValue("AppStarting","%SYSTEMROOT%\Cursors\W11_dark_v2.2\working.ani")
$RegCursors.SetValue("Arrow","%SYSTEMROOT%\Cursors\W11_dark_v2.2\pointer.cur")
$RegCursors.SetValue("Crosshair","%SYSTEMROOT%\Cursors\W11_dark_v2.2\precision.cur")
$RegCursors.SetValue("Hand","%SYSTEMROOT%\Cursors\W11_dark_v2.2\link.cur")
$RegCursors.SetValue("Help","%SYSTEMROOT%\Cursors\W11_dark_v2.2\help.cur")
$RegCursors.SetValue("IBeam","%SYSTEMROOT%\Cursors\W11_dark_v2.2\beam.cur")
$RegCursors.SetValue("No","%SYSTEMROOT%\Cursors\W11_dark_v2.2\unavailable.cur")
$RegCursors.SetValue("NWPen","%SYSTEMROOT%\Cursors\W11_dark_v2.2\handwriting.cur")
$RegCursors.SetValue("Person","%SYSTEMROOT%\Cursors\W11_dark_v2.2\person.cur")
$RegCursors.SetValue("Pin","%SYSTEMROOT%\Cursors\W11_dark_v2.2\pin.cur")
$RegCursors.SetValue("precisionhair","%SYSTEMROOT%\Cursors\W11_dark_v2.2\precision.cur")
$RegCursors.SetValue("SizeAll","%SYSTEMROOT%\Cursors\W11_dark_v2.2\move.cur")
$RegCursors.SetValue("SizeNESW","%SYSTEMROOT%\Cursors\W11_dark_v2.2\dgn2.cur")
$RegCursors.SetValue("SizeNS","%SYSTEMROOT%\Cursors\W11_dark_v2.2\vert.cur")
$RegCursors.SetValue("SizeNWSE","%SYSTEMROOT%\Cursors\W11_dark_v2.2\dgn1.cur")
$RegCursors.SetValue("SizeWE","%SYSTEMROOT%\Cursors\W11_dark_v2.2\horz.cur")
$RegCursors.SetValue("UpArrow","%SYSTEMROOT%\Cursors\W11_dark_v2.2\alternate.cur")
$RegCursors.SetValue("Wait","%SYSTEMROOT%\Cursors\W11_dark_v2.2\busy.ani")
$RegCursors.Close()
$RegConnect.Close()

Add-Type @"
using System.Runtime.InteropServices;
public class WinAPI {
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo", SetLastError = true)]
public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, string pvParam, uint fWinIni);
}
"@
[WinAPI]::SystemParametersInfo(0x0057, 0, $null, 0)

}


if (($NightValue -ne $PreviousNightValue))
{
    $NightValue | Export-Clixml -path $nightValueFilePath
}

$StartValue = 0
if ($StartValue -ne 0)
{
    $StartValue | Export-Clixml -path $startValueFilePath
}