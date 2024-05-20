$params = $Input | ConvertFrom-Json

If (-Not $params.imagePaths) {
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
    Update-Module -Name VirtualDesktop -Force
    $settingsUpdated = $true
}

Get-DesktopList | ForEach-Object {
    if (-Not (Test-CurrentDesktop -Desktop $_.Number)) {
        Set-DesktopWallpaper -Desktop $_.Number -Path $params.imagePaths
    }
}

if ($settingsUpdated) {
    $currentWinVer | Export-Clixml -Path $settingsFile
}
