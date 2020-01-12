$daySegment2 = [int]$args[0]  # 0 = Day, 1 = Night
$daySegment4 = [int]$args[1]  # 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
$imagePath = $args[2]

Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Windows.MessageBox]::Show([string]$daySegment2 + ' ' + [string]$daySegment4 + ' ' + $imagePath)
