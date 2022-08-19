param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][string]$imagePath, # Path to current wallpaper image
    [Parameter(Mandatory=$true)][bool]$nightMode    # True if night mode is enabled
)

$jsonFilePath = "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$jsonDataOld = Get-Content -Path $jsonFilePath
$imagePath = $imagePath.Replace('\', '\\')

If ($jsonDataOld -imatch '"backgroundImage":') {
    $jsonDataNew = $jsonDataOld -replace ('"backgroundImage": ".+"', "`"backgroundImage`": `"$imagePath`"")
} Elseif (-Not ($jsonDataOld -imatch '"defaults": {}')) {
    $jsonDataNew = $jsonDataOld -replace ('"defaults": {', "`"defaults`": {
            `"backgroundImage`": `"$imagePath`",")
} Else {
    $jsonDataNew = $jsonDataOld -replace ('"defaults": {}', "`"defaults`": {
            `"backgroundImage`": `"$imagePath`"
        }")
}

If ($jsonDataNew -ne $jsonDataOld) {
    Set-Content -Path $jsonFilePath -Value $jsonDataNew
}
