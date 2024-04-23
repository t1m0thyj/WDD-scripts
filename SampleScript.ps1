# To test with sample event, run: cat SampleEvent.json | .\SampleScript.ps1
$params = $Input | ConvertFrom-Json

Add-Type -AssemblyName PresentationCore,PresentationFramework
[System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[System.Windows.MessageBox]::Show(($params | Format-List | Out-String), "WinDynamicDesktop")
