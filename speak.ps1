# https://stackoverflow.com/questions/56032478/how-do-you-get-windows-powershell-to-play-a-sound-after-bat-job-has-finished-ru

Add-Type -AssemblyName System.Speech
$synth = New-Object -TypeName System.Speech.Synthesis.SpeechSynthesizer

$synth.SelectVoice("Microsoft Zira Desktop")
# $synth.SelectVoice("Microsoft David Desktop")

$utterance = ($args.length -gt 0) ? $args[0] : "Process complete."
$synth.Speak($utterance)
