$params = $Input | ConvertFrom-Json

If ($params.imagePaths -And (Test-Path "~\AppData\Local\Microsoft\Edge\User Data\Default")) {
    Copy-Item $params.imagePaths[0] "~\AppData\Local\Microsoft\Edge\User Data\Default\edge_background.jpg"
}
