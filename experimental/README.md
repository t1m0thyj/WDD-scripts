# Experimental PowerShell scripts

**Note:** Scripts are a new feature in WinDynamicDesktop 4.0. Click [here](https://github.com/t1m0thyj/WinDynamicDesktop/wiki/Installing-scripts) for instructions on how to install them.

## Table of Contents

- [Change Microsoft Edge Theme](#change-microsoft-edge-theme)
- [Change Microsoft Edge Background Image (Default profile)](#change-microsoft-edge-background-image-default-profile)
- [Synchronize Virtual Desktops](#synchronize-virtual-desktops)

---

## Change Microsoft Edge Theme

Changes Microsoft Edge theme based on the time of day.

**Author:** @t1m0thyj

**Requirements:**
- Windows 10
- Desktop version of WDD (doesn't work in Microsoft Store app)

⚠️ Changing the theme does not update it in Edge immediately, restarting the browser is required for the change to take effect.

[Download](/experimental/ChangeMicrosoftEdgeTheme.ps1?raw=true)

---

## Change Microsoft Edge Background Image (Default profile)

Changes Microsoft Edge background image based on the time of day.

**Author:** @khuongduybui

**Requirements:**
- Windows 10
- Desktop version of WDD (doesn't work in Microsoft Store app)

⚠️ This only changes the background for the default profile. Please edit the script on your computer to include other profiles.

[Download](/experimental/ChangeEdgeBackgroundDefault.ps1?raw=true)

---

## Synchronize Virtual Desktops

Synchronizes the same wallpaper across multiple virtual desktops.

**Author:** @t1m0thyj

**Requirements:**
- Windows 11
- Single wallpaper is set across all monitors

⚠️ This script uses an unofficial API that is not supported by Microsoft and may break in future versions of Windows.

[Download](/experimental/SyncVirtualDesktops.ps1?raw=true)
