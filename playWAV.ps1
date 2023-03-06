$PlayWav = New-Object System.Media.SoundPlayer
$invocationPath = Split-Path $MyInvocation.MyCommand.Path -Parent

$filepath = ($args.length -gt 0) ? $args[0] : ($invocationPath + ’\blaster-firing.wav’)

$PlayWav.SoundLocation = $filepath
$PlayWav.playsync()
