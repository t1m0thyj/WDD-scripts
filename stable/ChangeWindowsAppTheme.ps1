$params = $Input | ConvertFrom-Json

$registryPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$dwordValue = 1 - $(If ($params.themeMode -Eq 0) {$params.daySegment2} Else {$params.themeMode - 1})

if (Test-Path $registryPath)
{
    New-ItemProperty -Path $registryPath -Name "AppsUseLightTheme" -Value $dwordValue -PropertyType DWORD -Force | Out-Null
}

# Call Windows theme refresh
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Win32Utils {
    [DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)]
    public static extern int SendMessageTimeout(IntPtr hWnd, int Msg, IntPtr wParam, IntPtr lParam, int fuFlags, int uTimeout, out IntPtr lpdwResult);
}
"@ -PassThru

$HWND_BROADCAST = [IntPtr]::Zero -bor 0xFFFF
$WM_SETTINGCHANGE = 0x1A
$SPI_SETCLIENTAREAANIMATION = 0x1043

$param = [System.Runtime.InteropServices.Marshal]::StringToHGlobalUni("ImmersiveColorSet")

$null = [Win32Utils]::SendMessageTimeout($HWND_BROADCAST, $WM_SETTINGCHANGE, [IntPtr]::Zero, $param, 2, 5000, [ref]([IntPtr]::Zero))

[System.Runtime.InteropServices.Marshal]::FreeHGlobal($param)
