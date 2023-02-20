param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)
$NightValue = If ($nightMode) {1} Else {$daySegment2}
if ( $NightValue -eq 0)
{
$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”)
$RegCursors = $RegConnect.OpenSubKey(“Control Panel\Cursors”,$true)
$RegCursors.SetValue(“”,”W11 Cursor Light HD v2.2 by Jepri Creations”)
$RegCursors.SetValue(“AppStarting”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\working.ani”)
$RegCursors.SetValue(“Arrow”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\pointer.cur”)
$RegCursors.SetValue(“Crosshair”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\precision.cur”)
$RegCursors.SetValue(“Hand”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\link.cur”)
$RegCursors.SetValue(“Help”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\help.cur”)
$RegCursors.SetValue(“IBeam”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\beam.cur”)
$RegCursors.SetValue(“No”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\unavailable.cur”)
$RegCursors.SetValue(“NWPen”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\handwriting.cur”)
$RegCursors.SetValue(“Person”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\person.cur”)
$RegCursors.SetValue(“Pin”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\pin.cur”)
$RegCursors.SetValue(“precisionhair”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\precision.cur”)
$RegCursors.SetValue(“SizeAll”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\move.cur”)
$RegCursors.SetValue(“SizeNESW”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\dgn2.cur”)
$RegCursors.SetValue(“SizeNS”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\vert.cur”)
$RegCursors.SetValue(“SizeNWSE”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\dgn1.cur”)
$RegCursors.SetValue(“SizeWE”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\horz.cur”)
$RegCursors.SetValue(“UpArrow”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\alternate.cur”)
$RegCursors.SetValue(“Wait”,”%SYSTEMROOT%\Cursors\W11_light_v2.2\busy.ani”)
$RegCursors.Close()
$RegConnect.Close()
$CSharpSig = @’
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
public static extern bool SystemParametersInfo(
             uint uiAction,
             uint uiParam,
             uint pvParam,
             uint fWinIni);
‘@
$CursorRefresh = Add-Type -MemberDefinition $CSharpSig -Name WinAPICall -Namespace SystemParamInfo –PassThru
$CursorRefresh::SystemParametersInfo(0x0057,0,$null,0)
}
else
{
$RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”)
$RegCursors = $RegConnect.OpenSubKey(“Control Panel\Cursors”,$true)
$RegCursors.SetValue(“”,”W11 Cursors Dark HD v2.2 by Jepri Creations”)
$RegCursors.SetValue(“AppStarting”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\working.ani”)
$RegCursors.SetValue(“Arrow”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\pointer.cur”)
$RegCursors.SetValue(“Crosshair”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\precision.cur”)
$RegCursors.SetValue(“Hand”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\link.cur”)
$RegCursors.SetValue(“Help”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\help.cur”)
$RegCursors.SetValue(“IBeam”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\beam.cur”)
$RegCursors.SetValue(“No”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\unavailable.cur”)
$RegCursors.SetValue(“NWPen”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\handwriting.cur”)
$RegCursors.SetValue(“Person”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\person.cur”)
$RegCursors.SetValue(“Pin”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\pin.cur”)
$RegCursors.SetValue(“precisionhair”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\precision.cur”)
$RegCursors.SetValue(“SizeAll”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\move.cur”)
$RegCursors.SetValue(“SizeNESW”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\dgn2.cur”)
$RegCursors.SetValue(“SizeNS”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\vert.cur”)
$RegCursors.SetValue(“SizeNWSE”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\dgn1.cur”)
$RegCursors.SetValue(“SizeWE”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\horz.cur”)
$RegCursors.SetValue(“UpArrow”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\alternate.cur”)
$RegCursors.SetValue(“Wait”,”%SYSTEMROOT%\Cursors\W11_dark_v2.2\busy.ani”)
$RegCursors.Close()
$RegConnect.Close()
$CSharpSig = @’
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
public static extern bool SystemParametersInfo(
             uint uiAction,
             uint uiParam,
             uint pvParam,
             uint fWinIni);
‘@
$CursorRefresh = Add-Type -MemberDefinition $CSharpSig -Name WinAPICall -Namespace SystemParamInfo –PassThru
$CursorRefresh::SystemParametersInfo(0x0057,0,$null,0)
}