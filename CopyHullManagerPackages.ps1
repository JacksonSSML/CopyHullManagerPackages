$server = Read-Host -Prompt "Input Vessel Server IP address:"
net use \\$server\c$ /user:enterprise\ship-admin *
if (Test-Path \\$server\c$) {
    echo "Connected to server"
    echo "Attempting file retrieval"
    robocopy \\$server\C$\GL\HullManager\Board\Outgoing\Offline C:\ProgramData\GL\HullManager\Shore\Incoming\Import -fft -w:360 -r:10 -z
} 

else {
    echo "Unable to connect to server. Pinging $server"
    ping $server
}