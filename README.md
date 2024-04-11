# WDD-scripts
PowerShell scripts that add features to [WinDynamicDesktop](https://github.com/t1m0thyj/WinDynamicDesktop)

**Note:** Scripts are a new feature in WinDynamicDesktop 4.0. Click [here](https://github.com/t1m0thyj/WinDynamicDesktop/wiki/Installing-scripts) for instructions on how to install them.

## Browse Existing Scripts

Select a category of scripts to browse:

* [Stable](/stable#readme)
* [Experimental](/experimental#readme)
* [Other scripts](/other#readme)

## Create New Scripts

PowerShell scripts are run by WinDynamicDesktop when the wallpaper image is updated. They are invoked with a JSON object that contains the following parameters:

* `daySegment2` - 0 = Day, 1 = Night
* `daySegment4` - -1 = N/A, 0 = Sunrise, 1 = Day, 2 = Sunset, 3 = Night
* `themeMode` - 0 = Automatic, 1 = Light Mode, 2 = Dark Mode
* `imagePaths` - List of paths to current wallpaper image for each display

To read the values of these parameters, add the line below to the top of your script and access them like this: `$event.daySegment2`

```powershell
$event = $Input | ConvertFrom-Json
```

A sample script that uses parameters can be found [here](./SampleScript.ps1). When the sample script is installed and gets run by WinDynamicDesktop, it will display the values of all the parameters.

If you create a script and would like to share it with other users of the app, pull requests in this repository are welcome.
