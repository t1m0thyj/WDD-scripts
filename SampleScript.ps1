param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][string]$imagePath, # Path to current wallpaper image
    [Parameter(Mandatory=$true)][bool]$nightMode    # True if night mode is enabled
)

Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Windows.MessageBox]::Show([string]$daySegment2 + ' ' + [string]$daySegment4 + ' ' + $imagePath + ' ' + [string]$nightMode)
