# WDD-scripts
PowerShell scripts that add features to [WinDynamicDesktop](https://github.com/t1m0thyj/WinDynamicDesktop)

**Note:** Scripts are a new feature in WinDynamicDesktop 4.0. Click [here](https://github.com/t1m0thyj/WinDynamicDesktop/wiki/Installing-scripts) for instructions on how to install them.

## Browse Existing Scripts

Select a category of scripts to browse:

* [PowerShell (stable)](/stable)
* [PowerShell (experimental)](/experimental)
* [Registry Editor](/registry)

## Create New Scripts

PowerShell scripts are run by WinDynamicDesktop when the wallpaper image is updated. They are invoked with the following parameters:

`<scriptName> [-daySegment2] <int> [-daySegment4] <int> [-imagePath] <string>`

To read the values of these parameters, add the following lines at the top of your script:

```powershell
param (
    [Parameter(Mandatory=$true)][int]$daySegment2,  # 0 = Day, 1 = Night
    [Parameter(Mandatory=$true)][int]$daySegment4,  # 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
    [Parameter(Mandatory=$true)][string]$imagePath  # Path to current wallpaper image
)
```

A sample script that makes use of these variables can be found [here](./SampleScript.ps1). When the sample script is installed and gets run by WinDynamicDesktop, it will display the values of `daySegment2`, `daySegment4`, and `imagePath`.

If you create a script and would like to share it with other users of the app, pull requests in this repository are welcome.
