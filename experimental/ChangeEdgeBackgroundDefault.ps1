param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)

If (-Not ($PSBoundParameters.ContainsKey("imagePath"))) {
    Break
}

If (Test-Path "~\AppData\Local\Microsoft\Edge\User Data\Default") {
    Copy-Item $imagePath "~\AppData\Local\Microsoft\Edge\User Data\Default\edge_background.jpg"
}
