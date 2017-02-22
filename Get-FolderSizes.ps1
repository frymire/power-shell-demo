foreach ($i in (Get-ChildItem $pwd)) {
    $objFSO = New-Object -com  Scripting.FileSystemObject
    $i.name + " - " + "{0:N2}" -f (($objFSO.GetFolder($pwd.path + "\" + $i.name).Size) / 1MB) + " MB"
}