# PowerShell scripts (experimental)

**Note:** Scripts are a new feature in WinDynamicDesktop 4.0. Click [here](https://github.com/t1m0thyj/WinDynamicDesktop/wiki/Installing-scripts) for instructions on how to install them.

## Table of Contents

- [Change Lockscreen Image](#change-lockscreen-image)
- [Change Microsoft Edge Theme](#change-microsoft-edge-theme)
- [Change Microsoft Edge Background Image (Default profile)](#change-microsoft-edge-background-image-default-profile)

---

## Change Lockscreen Image

Changes lockscreen image dynamically to match desktop wallpaper.

**Author:** @t1m0thyj

**Requirements:**
- Windows 10
- The "Background" option must be set to "Picture" in the Windows 10 lockscreen settings

⚠️ Changing the image does not work consistently (see [MSDN](https://social.msdn.microsoft.com/Forums/vstudio/en-US/c5f7e014-a1a1-4d62-b550-7976381d62cd/change-windows-8-lockscreen-image-with-wpfservice-only-works-once?forum=wpf)).

[Download](/experimental/ChangeLockscreenImage.ps1?raw=true)

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
