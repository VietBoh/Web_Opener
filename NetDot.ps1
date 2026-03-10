Clear-Host

# Initialization Script
[Array]$Logo = @(

    "░███    ░██               ░██    ░███████                 ░██   ",
    "░████   ░██               ░██    ░██   ░██                ░██   ",
    "░██░██  ░██  ░███████  ░████████ ░██    ░██  ░███████  ░████████",
    "░██ ░██ ░██ ░██    ░██    ░██    ░██    ░██ ░██    ░██    ░██   ",
    "░██  ░██░██ ░█████████    ░██    ░██    ░██ ░██    ░██    ░██   ",
    "░██   ░████ ░██           ░██    ░██   ░██  ░██    ░██    ░██   ",
    "░██    ░███  ░███████      ░████ ░███████    ░███████      ░████"

)

$CopyRight = "                  Made by DevCore"
# Initialization Script

# Main Script
ForEach($Print in $Logo){
    Write-Host $Print -ForegroundColor Cyan
    Start-Sleep -Milliseconds 40
}
Start-Sleep -Seconds 2
"`r"
Write-Host $CopyRight -ForegroundColor Blue
Start-Sleep -Seconds 3

While($true){
    Clear-Host
    [string]$URL = Read-Host "Enter URL or type `"Quit or Q`" to quit"
    if($URL -in @('Quit','Q','q')){ break }

    if([string]::IsNullOrWhiteSpace($URL)){
        Write-Warning "`nURLs cannot be left blank."
        Start-Sleep -Seconds 3
    }else{
        Write-Host "Checking the website" -ForegroundColor DarkGray
        $ping = ping "$URL"

        if($ping -match "^(Ping request could not)"){
            Write-Warning "$URL does not exist"
            Pause
            Continue
        }else{
            for($i = 0; $i -le 100; $i++){
                Write-Progress -Activity "Opening the $URL. Please wait." -Status "$i%" -PercentComplete $i
                Start-Sleep -Milliseconds 20
            }
            Write-Progress -Activity "Opening the $URL. Please wait." -Completed
            Start-Process "$URL"
        }
    }
}
# Main Script
