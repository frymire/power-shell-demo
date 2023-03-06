# Put this in C:\Users\mark.frymire.SERCO-NA\Documents\PowerShell\

If (($pwd).Path -eq $HOME) {
	cd "D:\code"
}

# Show navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Enable autocompletion for arrow keys.
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-Alias grep findstr
