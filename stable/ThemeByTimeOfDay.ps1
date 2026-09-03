# WinDynamicDesktop script: switch Windows theme by time of day
# Install in WDD: Settings -> Scripts -> Install from file

# ===== SETTINGS (time in HH:MM format) =====
$lightTime = "08:00"   # when to switch to the light theme
$darkTime  = "20:00"   # when to switch to the dark theme
# ===========================================

$params = $Input | ConvertFrom-Json

$now = Get-Date
$light = [datetime]::ParseExact($lightTime, "HH:mm", $null)
$dark  = [datetime]::ParseExact($darkTime,  "HH:mm", $null)
$t = $now.TimeOfDay
$L = $light.TimeOfDay
$D = $dark.TimeOfDay

# if light < dark: light theme between lightTime and darkTime; otherwise the opposite
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
    # apply the change without restarting explorer
    $sig = '[DllImport("user32.dll", SetLastError = true)] public static extern IntPtr SendMessageTimeout(IntPtr hWnd, uint Msg, UIntPtr wParam, string lParam, uint fuFlags, uint uTimeout, out UIntPtr lpdwResult);'
    Add-Type -Namespace Win32 -Name Msg -MemberDefinition $sig
    [UIntPtr]$result = [UIntPtr]::Zero
    [Win32.Msg]::SendMessageTimeout([IntPtr]0xffff, 0x001A, [UIntPtr]::Zero, "ImmersiveColorSet", 2, 5000, [ref]$result) | Out-Null
}
