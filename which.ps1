Get-Command $args[0] | Select-Object -ExpandProperty Definition
# You could do (gcm {program name}).Definition
