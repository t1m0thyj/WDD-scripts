bigplayer-ai contribution:
bigplayer-ai contribution:
### for the qBitTorrent fluent theme switch to work:
you need to create a folder called themes in the PowerShell scripts WDD folder:
"~\AppData\Local\WinDynamicDesktop\script\qbittorrenttheme"
and copy these two files(https://github.com/witalihirsch/qBitTorrent-fluent-theme) to the "qbittorrenttheme" folder in the WDD PowerShell scripts folder. 

a) fluent-light.qbtheme

b) fluent-dark.qbtheme

Also, you need to change the qBitTorrent theme in settings to this:

![Clip_20230217_114652](https://user-images.githubusercontent.com/119108387/219610478-fa74004a-dc00-4919-b9b4-9b3f47b7a5bc.png)

### for the mouse scheme switch:
Change the mouse scheme depending on the system OS theme. 
I used these mouse schemes:
https://www.deviantart.com/jepricreations/art/Windows-11-Cursors-Concept-v2-886489356
1) you need to switch to the desired mouse scheme.
2) export all registry keys from regedit.exe "Computer\HKEY_CURRENT_USER\Control Panel\Cursors"
3) convert .reg to PowerShell using this website.
https://reg2ps.azurewebsites.net/
4) replace the lines mentioned below in the MouseCursorSwitch.ps1 file with the output PowerShell script from the website.

**For light mode desired mouse scheme,** replace these lines with website output:
**from line 10** ($RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”))
**to line 32** ($RegConnect.Close()).

**For dark mode desired mouse scheme,** replace these lines with website output:
**from line 47**($RegConnect = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey([Microsoft.Win32.RegistryHive]”CurrentUser”,”$env:COMPUTERNAME”))
**to line 80** ($CursorRefresh::SystemParametersInfo(0x0057,0,$null,0)).
5)Place the edited MouseCursorSwitch.ps1 file in your WDD scripts folder: 
"~\AppData\Local\WinDynamicDesktop\script".
### restart explorer while saving windows positions and paths if dark/light mode switches (to reload all tweaked registry values).

1) create in the WDD scripts folder a folder like this:
"~\AppData\Local\WinDynamicDesktop\scripts\globalScripts"

2) put all the files mentioned below in it. (I added the .xml files so the transition would be more seamless (no errors on the first run)):

a) NightValue.xml

b) StartValue.xml

c) UpdateNightValueAtStartup.ps1

d)restart_explorer.bat

3) put the ZRestartExplroer.ps1 in the WDD native scripts' folder:
"~\AppData\Local\WinDynamicDesktop\scripts"

4) delay WDD log on task scheduler for 1 second.

5) add another start-up task that runs UpdateNightValueAtStartup.ps1.

6) enjoy restarting explorer only when needed to reload all the tweaked registry values.

