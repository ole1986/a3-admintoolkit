Param(
    [switch]$BuildServer = $false,
    [switch]$BuildClient = $false,
    [switch]$Install = $false,
    [switch]$Run = $false
)

$steamPath = (Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Valve\Steam -Name SteamPath).SteamPath
$GameFolder = "$steamPath/steamapps/common/Arma 3"
$AddonBuilder = "$steamPath/steamapps/common/Arma 3 Tools/AddonBuilder/AddonBuilder.exe"

if(!$steamPath) {
    Write-Host -ForegroundColor Red "No Steam installation found"
    Exit
}

if(!(Test-Path $AddonBuilder)) {
    Write-Host -ForegroundColor Red "Addon Builder from Arma 3 Tools not found"
    Write-Host "You can install it through Steam - https://community.bistudio.com/wiki/Arma_3_Tools_Installation"
    Exit
}

if($BuildServer) {
    Write-Host -ForegroundColor DarkYellow "AddonBuilder: Building Server PBO"
    & "$AddonBuilder" "$PSScriptRoot\\source\\admintoolkit_server" "$PSScriptRoot\\@AdminToolkitServer\\addons" -packonly
    Write-Host -ForegroundColor DarkYellow "AddonBuilder: Building Server Config PBO"
    & "$AddonBuilder" "$PSScriptRoot\\source\\admintoolkit_servercfg" "$PSScriptRoot\\@AdminToolkitServer\\addons" -packonly
}

if($BuildClient) {
    Write-Host -ForegroundColor DarkYellow "AddonBuilder: Building Client PBO"
    & "$AddonBuilder" "$PSScriptRoot\\source\\admintoolkit" "$PSScriptRoot\\@AdminToolkit\\addons" -packonly -sign="$PSScriptRoot\\admintoolkit.biprivatekey"
}

if($Install) {
    Write-Host -NoNewline "Shutting down arma3 instance..."
    # End the arma3 instance firsrt
    $found = Get-Process | Where-Object { ($_.Name -eq "arma3_x64") -or ($_.Name -eq "arma3") } | Select-Object -First 1
    if($found) {
        $found | Stop-Process
        Write-Host -ForegroundColor Green "DONE"
    } else {
        Write-Host "NOT RUNNING"
    }

    Write-Host "Wait some seconds until all is released..."
    Start-Sleep 2

    Write-Host -NoNewline "Installing AdminToolkit client into $GameFolder..."
    Copy-Item -Recurse .\@AdminToolkit -Destination $GameFolder -Force
    Write-Host -ForegroundColor Green "DONE"
    if($Run) {
        Write-Host -NoNewline "Running Arma 3..."
        & "$GameFolder/arma3.exe" -nosplash -world=empty -skipIntro
        Write-Host -ForegroundColor Green "DONE"
    }
}
