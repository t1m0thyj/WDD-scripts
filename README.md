bigplayer-ai contribution:
### for the qBitTorrent fluent theme switch to work, you need to create two folders:
1) called themes in the qBitTorrent installation folder
2) called themes in the PowerShell scripts WDD folder.
The themes' folder in the WDD PowerShell scripts folder should have the qBitTorrent fluent themes from this repo:
https://github.com/witalihirsch/qBitTorrent-fluent-theme
Also, you need to change the qBitTorrent theme in settings to this:

![Clip_20230217_114652](https://user-images.githubusercontent.com/119108387/219610478-fa74004a-dc00-4919-b9b4-9b3f47b7a5bc.png)

### for the mouse scheme switch:
Change mouse scheme depending on the system OS theme. 
I used these mouse schemes:
https://www.deviantart.com/jepricreations/art/Windows-11-Cursors-Concept-v2-886489356
1) you need to switch to the desired mouse scheme.
2) export all registry keys from regedit.exe "Computer\HKEY_CURRENT_USER\Control Panel\Cursors"
3) convert .reg to PowerShell using this website.
https://reg2ps.azurewebsites.net/
4) replace the lines mentioned down in the MouseCursorSwitch.ps1 file with the output PowerShell script from the website
**for light mode desired mouse scheme,** replace these lines with website output:
**from line 10** ($RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”))
**to line 32** ($RegConnect.Close()).

**For dark mode desired mouse scheme,** replace these lines with website output:
**from line 47**($RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”))
**to line 80** ($CursorRefresh::SystemParametersInfo(0x0057,0,$null,0)).

# WDD-scripts
PowerShell scripts that add features to [WinDynamicDesktop](https://github.com/t1m0thyj/WinDynamicDesktop)

**Note:** Scripts are a new feature in WinDynamicDesktop 4.0. Click [here](https://github.com/t1m0thyj/WinDynamicDesktop/wiki/Installing-scripts) for instructions on how to install them.

## Browse Existing Scripts

Select a category of scripts to browse:

* [Stable](/stable#readme)
* [Experimental](/experimental#readme)
* [Other scripts](/other#readme)

## Create New Scripts

PowerShell scripts are run by WinDynamicDesktop when the wallpaper image is updated. They are invoked with the following parameters:

`<scriptName> [-daySegment2] <int> [-daySegment4] <int> [-nightMode] <bool> [-imagePath <string>]`

To read the values of these parameters, add the following lines at the top of your script:

```powershell
param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][bool]$nightMode,   # True if night mode is enabled
    [Parameter(Mandatory=$false)][string]$imagePath # Path to current wallpaper image
)
```

A sample script that makes use of these variables can be found [here](./SampleScript.ps1). When the sample script is installed and gets run by WinDynamicDesktop, it will display the values of all the parameters.

If you create a script and would like to share it with other users of the app, pull requests in this repository are welcome.
