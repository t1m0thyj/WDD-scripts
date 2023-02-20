bigplayer-ai contribution:
### for the qBitTorrent fluent theme switch to work, you need to create two folders:
1) called themes in the qBitTorrent installation folder
2) called themes in the PowerShell scripts WDD folder.
The themes' folder in the WDD PowerShell scripts folder should have the qBitTorrent fluent themes (I used the mica themes you can change the script accordingly to your liking) from this repo:
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
