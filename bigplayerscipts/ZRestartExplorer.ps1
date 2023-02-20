param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)
$Location = "~\AppData\Local\WinDynamicDesktop\scripts\globalScripts\NightValue.xml"
$PreviousNightValue = Import-CliXml $Location
$NightValue = If ($nightMode) {1} Else {$daySegment2}

$Location2 = "~\AppData\Local\WinDynamicDesktop\scripts\globalScripts\StartValue.xml"
$StartValue = Import-CliXml $Location2

if ( ($NightValue -ne $PreviousNightValue) -and ($StartValue -ne 1))
{
   & "~\AppData\Local\WinDynamicDesktop\scripts\globalScripts\restart_explorer.bat"
}

$StartValue = 0
$NightValue | Export-Clixml -path $Location
$StartValue | Export-Clixml -path $Location2