# This script monitors the CPU usage of OneDrive and, if it falls below 1%, kills and restarts it on a while-true loop.

# To match the CPU usage to for example Process Explorer you need to divide by the number of cores
$cpu_cores = (Get-WMIObject Win32_ComputerSystem).NumberOfLogicalProcessors

while (1 -eq 1) {

    $process = (Start-Process OneDrive -passthru)

    # To get the PID of the process (this will give you the first occurrence if multiple matches)
    $proc_pid = $process.Id[0]

    # This is to find the exact counter path, as you might have multiple processes with the same name
    $proc_path = ((Get-Counter "\Process(*)\ID Process").CounterSamples | ? {$_.RawValue -eq $proc_pid}).Path


    for ($i=1; $i -le 60; $i++) {

        start-sleep 5
        $i

        # We now get the CPU percentage
        $prod_percentage_cpu = [Math]::Round(((Get-Counter ($proc_path -replace "\\id process$","\% Processor Time")).CounterSamples.CookedValue) / $cpu_cores)
        $prod_percentage_cpu
    
        If ($prod_percentage_cpu -le 1) {
            “Stop\n”
            kill $process.Id
            break
        } Else {
            “Go\n”
        }
    }

}
