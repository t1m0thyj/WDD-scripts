param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)
Start-Sleep -Milliseconds 1500
$NightValue = If ($nightMode) {1} Else {$daySegment2}

if ( ($NightValue -ne $env:PreviousNightValue) -and ($env:StartValue -ne 1))
{
   Start-Sleep -Milliseconds 800
   $SavedWindows = Get-ExplorerWindow -Quit
   Get-Process explorer | Stop-Process
   if ( $null -ne $SavedWindows)
   {
        Restore-Explorerwindow $SavedWindows
   }
}