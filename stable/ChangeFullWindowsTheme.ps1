$params = $Input | ConvertFrom-Json

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$dwordValue = 1 - $(If ($params.themeMode -Eq 0) {$params.daySegment2} Else {$params.themeMode - 1})

if (Test-Path $registryPath) {
    Set-ItemProperty -Path $registryPath -Name "AppsUseLightTheme" -Value $dwordValue -Type DWORD -Force
    Set-ItemProperty -Path $registryPath -Name "SystemUsesLightTheme" -Value $dwordValue -Type DWORD -Force
}

if ([System.Environment]::OSVersion.Version.Build -ge 22000)
{
	# Call Windows theme refresh
	Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Win32Utils {
	[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
	public static extern int SendMessageTimeout(IntPtr hWnd, int Msg, IntPtr wParam, string lParam, int fuFlags, int uTimeout, out IntPtr lpdwResult);
}
"@ -PassThru

	$HWND_BROADCAST = [IntPtr]0xFFFF
	$WM_SETTINGCHANGE = 0x1A
	$SMTO_ABORTIFHUNG = 0x2
	[Win32Utils]::SendMessageTimeout($HWND_BROADCAST, $WM_SETTINGCHANGE, [IntPtr]::Zero, "ImmersiveColorSet", $SMTO_ABORTIFHUNG, 5000, [ref]([IntPtr]::Zero))
}
