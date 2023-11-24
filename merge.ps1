# Retrieve command line arguments
$relativePath = $args[0]
$destinationFile = Join-Path -Path $pwd -ChildPath $relativePath

# Generate the prefix based on the provided destination file
$baseNameWithoutExtension = [System.IO.Path]::GetFileName($destinationFile)
$partPrefix = "${baseNameWithoutExtension}.part-"
$partFiles = Get-ChildItem -Filter "${partPrefix}*" | Sort-Object Name

$destinationStream = [System.IO.File]::OpenWrite($destinationFile)

try {
    foreach ($part in $partFiles) {
        $bytes = [System.IO.File]::ReadAllBytes($part.FullName)
        $destinationStream.Write($bytes, 0, $bytes.Length)
    }
}
finally {
    $destinationStream.Close()
}
