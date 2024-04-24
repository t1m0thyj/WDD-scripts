$params = $Input | ConvertFrom-Json

If (-Not $params.imagePaths) {
    Break
}

$jsonFilePath = "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$jsonDataOld = Get-Content -Path $jsonFilePath
$imagePath = $params.imagePaths[0].Replace('\', '\\')

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
