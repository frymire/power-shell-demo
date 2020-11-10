# PowerShellDemo
Some custom PowerShell that I tend to reuse.

### Notes to Self ###
Add this directory to the user or system path.

Set the Powershell Execution Policy to allow local scripts:

<code>Set-ExecutionPolicy -ExecutionPolicy RemoteSigned<code>

Set a profile file (e.g. profile.ps1) as the target property of the PowerShell icon.

To use custom scripts at the command line, set up aliases in this profile file, using a command like

<code>Set-Alias myScript "C:\Path\To\Script\CustomScript.ps1".</code>
