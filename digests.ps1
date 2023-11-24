$path = $pwd.Path
$result = @()

Get-ChildItem -Path $path -File | ForEach-Object {

    $md5 = New-Object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
    $sha256 = New-Object -TypeName System.Security.Cryptography.SHA256CryptoServiceProvider
    
    $md5Hash = [System.BitConverter]::ToString($md5.ComputeHash([System.IO.File]::ReadAllBytes($_.FullName))) -replace '-'
    $sha256Hash = [System.BitConverter]::ToString($sha256.ComputeHash([System.IO.File]::ReadAllBytes($_.FullName))) -replace '-'
    
    $result += [PSCustomObject]@{
        'Filename' = $_.Name
        'MD5'  = $md5Hash
        'SHA256' = $sha256Hash
    }

    # Print . for progress
    Write-Host "." -NoNewline    
}

$result | Format-Table -AutoSize
