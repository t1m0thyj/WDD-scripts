param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][string]$imagePath, # Path to current wallpaper image
    [Parameter(Mandatory=$true)][bool]$nightMode    # True if night mode is enabled
)

if (-Not (Get-Module -ListAvailable -Name VirtualDesktop)) {
	Install-PackageProvider -Name NuGet -Force -Scope CurrentUser
    Install-Module -Name VirtualDesktop -Force -Scope CurrentUser
}

Get-DesktopList | ForEach-Object {
    if (-Not (Test-CurrentDesktop -Desktop $_.Number)) {
        Set-DesktopWallpaper -Desktop $_.Number -Path $imagePath
    }
}
