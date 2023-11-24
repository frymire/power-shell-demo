# Retrieve command line arguments
$relativePath = $args[0]
$sourceFile = Join-Path -Path $pwd -ChildPath $relativePath
$partSize = $args[1]
$partPrefix = "${sourceFile}.part-"
$buffer = New-Object byte[] $partSize
$partIndex = 0

try {
    $fileStream = [System.IO.File]::OpenRead($sourceFile)

    while (($readBytes = $fileStream.Read($buffer, 0, $partSize)) -gt 0) {
        $partFileName = "{0}{1:D5}" -f $partPrefix, $partIndex
        [System.IO.File]::WriteAllBytes($partFileName, $buffer[0..($readBytes - 1)])
        $partIndex++
    }
}
finally {
    if ($fileStream -ne $null) {
        $fileStream.Close()
    }
}
