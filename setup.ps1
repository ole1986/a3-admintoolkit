Param(
    [switch]$Build = $false,
    [switch]$Install = $false,
    [switch]$Run = $false,
    [switch]$PatchMission = $false
)

function Get-SteamPath()
{
    $regItem = (Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Valve\Steam -Name SteamPath -EA SilentlyContinue)
    if(!$regItem) {
        Write-Error  "No registry item found for Steam"
        Exit
    }

    $steamPath = (Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Valve\Steam -Name SteamPath).SteamPath
    if(!$steamPath) {
        Write-Error  "No Steam installation found"
        Exit
    }
    return $steamPath
}

function Pack-Pbo($SourcePath, $DestinationPath, $PrivateKeyPath)
{
    $AddonBuilder = "$(Get-SteamPath)/steamapps/common/Arma 3 Tools/AddonBuilder/AddonBuilder.exe"
    if(!(Test-Path $AddonBuilder)) {
        Write-Host -ForegroundColor Red "Addon Builder from Arma 3 Tools not found"
        Write-Host "You can install it through Steam - https://community.bistudio.com/wiki/Arma_3_Tools_Installation"
        Exit
    }
    $SourcePath = [System.IO.Path]::GetFullPath($SourcePath)
    $DestinationPath = [System.IO.Path]::GetFullPath($DestinationPath)
    
    if(($PrivateKeyPath) -and (Test-Path $PrivateKeyPath)) {
        $PrivateKeyPath = [System.IO.Path]::GetFullPath($PrivateKeyPath)
        $ERR = & "$AddonBuilder" "$SourcePath" "$DestinationPath" -packonly -sign="$PrivateKeyPath"
    } else {
        $ERR = & "$AddonBuilder" "$SourcePath" "$DestinationPath" -packonly
    }
    

    $ERR = & "$AddonBuilder" "$SourcePath" "$DestinationPath" -packonly
    Write-Output $ERR
    if($ERR -match "\[FATAL\]") {
        Write-Host -ForegroundColor Red "An error occured while executing the Arma 3 Tools."
        Write-Host -ForegroundColor Red "Please make sure STEAM is running"
        return $false
    }
    return $true
}

function Unpack-Pbo($SourceFile, $DestinationPath)
{
    $BankRev = "$(Get-SteamPath)/steamapps/common/Arma 3 Tools/BankRev/BankRev.exe"
    & "$BankRev" -f "$DestinationPath" "$SourceFile"
}


function Get-FileName($initialDirectory)
{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = "PBO (*.pbo)| *.pbo"
    $OpenFileDialog.ShowDialog() | Out-Null
    return $OpenFileDialog.filename
}

function Get-CodeBlockLastLineNumber($content, $FuncName) 
{
    $openBracket = 0
    $startLine = ($content | Select-String -Pattern "class $FuncName").LineNumber

    if(!$startLine) { return }

    for ($i = $startLine; $i -lt $content.Count; $i++) {
        $c = $content[$i] -replace """.*?""", ""
        $c = $c -replace "'.*?'", ""
        for ($j = 0; $j -lt $c.Length; $j++) {
            if($c[$j] -eq "{") {
                $openBracket += 1
            } elseif($c[$j] -eq "}") {
                $openBracket -= 1
            }
        }
        if($openBracket -le 0) {
            break
        }
    }
    return $i - 1
}

$GameFolder = "$(Get-SteamPath)/steamapps/common/Arma 3"

if(!(Test-Path $GameFolder)) {
    Write-Host -ForegroundColor Red "Game not found"
    Exit
}

if($Build) {
    Write-Host "Building Server PBO"
    $ok = Pack-Pbo "source\admintoolkit_server" "@AdminToolkitServer\addons"
    if(!$ok) { Exit }

    Write-Host "Building Server Config PBO"
    $ok = Pack-Pbo "source\admintoolkit_servercfg" "@AdminToolkitServer\addons"
    if(!$ok) { Exit }
    
    Write-Host "Building Client PBO"
    $ok = Pack-Pbo "source\admintoolkit" "@AdminToolkit\addons" "admintoolkit.biprivatekey"
    if(!$ok) { Exit }

    Write-Host -ForegroundColor Green "###################"
    Write-Host -ForegroundColor Green "# BUILD COMPLETED #"
    Write-Host -ForegroundColor Green "###################"
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
        & "$GameFolder/arma3battleye.exe" 2 1 0 -exe arma3_x64.exe -nosplash -world=empty -skipIntro
        Write-Host -ForegroundColor Green "DONE"
    }
}

if($PatchMission) {
    Write-Host -ForegroundColor Green "Please select your mission file from the dialog:"
    $missionFile = Get-FileName($PSScriptRoot)

    if(!$missionFile) {
        Write-Host "Canceled by user action"
        Exit
    }

    $extractedFolder = (Get-Item $missionFile).Basename
    New-Item "$env:TEMP\atk" -ItemType Directory -Force | Out-Null
    $extractedPath = "$env:TEMP\atk\$extractedFolder"
    # Unpack the mission file
    Unpack-Pbo "$missionFile" "$env:TEMP\atk"

    $content = Get-Content "$extractedPath\description.ext"
    
    if(!$content) {
        Write-Host -ForegroundColor Red "The description.ext could not be found in the mission file $extractedFolder - Very Strange! - Canceled"
        Exit
    }

    Write-Host "Copying mission related files into $extractedPath"
    Copy-Item "source\mission_file\*" -Destination "$extractedPath" -Recurse -Force

    Write-Host -NoNewline "Trying to patch file $extractedPath\description.ext..."

    if(!($content -match "class AdminToolkit_network_receiveRequest")) {
        $lastLineNumber = Get-CodeBlockLastLineNumber $content -FuncName "Functions"
        if(!$lastLineNumber) {
            Write-Host -ForegroundColor Red "FAILED (User action required - Sorry)"
            Exit
        }

        $content[$lastLineNumber] += "`n        class AdminToolkit_network_receiveRequest { allowedTargets=2; };"
        $content | Set-Content "$extractedPath\description.ext"
    } else {
        Write-Host -ForegroundColor Yellow "Already patched"
    }

    Write-Host "Building mission file '$extractedFolder'..."
    if(! (Pack-Pbo "$extractedPath" "@MissionFile")) {
        Exit
    }

    Write-Host -ForegroundColor Green "############"
    Write-Host -ForegroundColor Green "### DONE ###"
    Write-Host -ForegroundColor Green "############"
    Write-Host -ForegroundColor Green ""
    Write-Host -ForegroundColor Green "Patched MissionFile: $PSScriptRoot\@MissionFile\$extractedFolder.pbo"
}
