$event = $Input | ConvertFrom-Json

If ($event.imagePaths -And (Test-Path "~\AppData\Local\Microsoft\Edge\User Data\Default")) {
    Copy-Item $event.imagePaths[0] "~\AppData\Local\Microsoft\Edge\User Data\Default\edge_background.jpg"
}
