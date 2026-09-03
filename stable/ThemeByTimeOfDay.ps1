# WinDynamicDesktop script: switch Windows theme by time of day
# Install in WDD: Settings -> Scripts -> Install from file

# ===== НАСТРОЙКИ (время в формате ЧЧ:ММ) =====
$lightTime = "08:00"   # во сколько включать светлую тему
$darkTime  = "20:00"   # во сколько включать тёмную тему
# =============================================

$params = $Input | ConvertFrom-Json

$now = Get-Date
$light = [datetime]::ParseExact($lightTime, "HH:mm", $null)
$dark  = [datetime]::ParseExact($darkTime,  "HH:mm", $null)
$t = $now.TimeOfDay
$L = $light.TimeOfDay
$D = $dark.TimeOfDay

# если light < dark: светлая между lightTime и darkTime; иначе наоборот
if ($L -lt $D) {
    $wantLight = ($t -ge $L -and $t -lt $D)
} else {
    $wantLight = ($t -ge $L -or $t -lt $D)
}

$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"
$value = if ($wantLight) { 1 } else { 0 }

$current = Get-ItemProperty -Path $regPath
if ($current.AppsUseLightTheme -ne $value -or $current.SystemUsesLightTheme -ne $value) {
    Set-ItemProperty -Path $regPath -Name AppsUseLightTheme -Value $value -Type DWord
    Set-ItemProperty -Path $regPath -Name SystemUsesLightTheme -Value $value -Type DWord
    # чтобы смена применилась без перезапуска explorer
    Add-Type -Namespace Win32 -Name ThemeNotify -MemberDefinition `
        '[DllImport("uxtheme.dll", SetLastError = true)] public static extern void SetSystemVisualStyle(string vs, string color, string size, int unknown);'
    # broadcast settings change
    $sig = '[DllImport("user32.dll", SetLastError = true)] public static extern IntPtr SendMessageTimeout(IntPtr hWnd, uint Msg, UIntPtr wParam, string lParam, uint fuFlags, uint uTimeout, out UIntPtr lpdwResult);'
    Add-Type -Namespace Win32 -Name Msg -MemberDefinition $sig
    [UIntPtr]$result = [UIntPtr]::Zero
    [Win32.Msg]::SendMessageTimeout([IntPtr]0xffff, 0x001A, [UIntPtr]::Zero, "ImmersiveColorSet", 2, 5000, [ref]$result) | Out-Null
}
