param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)
# Define file paths for the xml files
$nightValueFilePath = "~\AppData\Local\WinDynamicDesktop\scripts\globalScripts\NightValue.xml"
$startValueFilePath = "~\AppData\Local\WinDynamicDesktop\scripts\globalScripts\StartValue.xml"

# Import the previous night value and start value from their xml files
$previousNightValue = Import-CliXml $nightValueFilePath
$startValue = Import-CliXml $startValueFilePath

Start-Sleep -Milliseconds 1500
$NightValue = If ($nightMode) {1} Else {$daySegment2}

if ( ($NightValue -ne $previousNightValue) -and ($StartValue) -ne 1)
{
    Start-Sleep -Milliseconds 800
    $SavedWindows = Get-ExplorerWindow -Quit
   Get-Process explorer | Stop-Process
   if ($null -ne $SavedWindows -and $SavedWindows.Count -gt 0)
   {
        Restore-Explorerwindow $SavedWindows
   }
}