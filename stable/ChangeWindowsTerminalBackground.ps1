param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)

If (-Not ($PSBoundParameters.ContainsKey("imagePath"))) {
    Break
}

$jsonFilePath = "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$jsonDataOld = Get-Content -Path $jsonFilePath
$imagePath = $imagePath.Replace('\', '\\')

If ($jsonDataOld -match '(?<!//\s*)"backgroundImage":') {
    $jsonDataNew = $jsonDataOld -replace ('(?<!//\s*)"backgroundImage": ".+"', "`"backgroundImage`": `"$imagePath`"")
} Elseif (-Not ($jsonDataOld -match '"defaults": {}')) {
    $jsonDataNew = $jsonDataOld -replace ('"defaults": {', "`"defaults`": {
            `"backgroundImage`": `"$imagePath`",")
} Else {
    $jsonDataNew = $jsonDataOld -replace ('"defaults": {}', "`"defaults`": {
            `"backgroundImage`": `"$imagePath`"
        }")
}

If ($jsonDataNew -ne $jsonDataOld) {
    Set-Content -Path $jsonFilePath`.tmp -Value $jsonDataNew
    Move-Item -Path $jsonFilePath`.tmp -Destination $jsonFilePath -Force
}
