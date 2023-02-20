param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)

If (-Not ($PSBoundParameters.ContainsKey("imagePath"))) {
    Break
}

$currentWinVer = (Get-CimInstance Win32_OperatingSystem).version
$settingsFile = "$((Get-Item $PSCommandPath).BaseName).dat"
$settingsUpdated = $false
if (-Not (Get-Module -ListAvailable -Name VirtualDesktop)) {
    Install-PackageProvider -Name NuGet -Force -Scope CurrentUser
    Install-Module -Name VirtualDesktop -Force -Scope CurrentUser
    $settingsUpdated = $true
} elseif (-Not (Test-Path -Path $settingsFile -PathType Leaf) -Or ($currentWinVer -Ne (Import-Clixml -Path $settingsFile))) {
    Update-Module -Name VirtualDesktop -Force -Scope CurrentUser
    $settingsUpdated = $true
}

Get-DesktopList | ForEach-Object {
    if (-Not (Test-CurrentDesktop -Desktop $_.Number)) {
        Set-DesktopWallpaper -Desktop $_.Number -Path $imagePath
    }
}

if ($settingsUpdated) {
    $currentWinVer | Export-Clixml -Path $settingsFile
}
