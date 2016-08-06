[CmdletBinding()]
Param(
    [Parameter(Position=0)]
    [string]$Path,
    [Parameter(Position=1)]
    [string]$Path2,
    [Parameter(Position=2)]
    [string]$Src,
    [Switch]$Generate,
    [Switch]$Sign,
    [Switch]$Install
)

$privateKeypath = ".\admintoolkit.biprivatekey"

$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes"
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No"
$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
$steamPath = (Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Valve\Steam -Name SteamPath).SteamPath
$AddonFolder = $steamPath + "/steamapps/common/Arma 3/@AdminToolkit"

if(!$Generate) {
    $result = $host.ui.PromptForChoice("Confirm PBO generation", "Generate PBO files?", $options, 0)
}

if($result -eq 0 -Or $Generate) {
    # CLIENT: use cpbo to (re)create the admintoolkit.pbo file
    Write-Host "--- Generate client PBO"
    cpbo -y -p .\source\admintoolkit .\@AdminToolkit\addons\admintoolkit.pbo

    # SERVER: replace sensitive password with an empty string in server config.cpp
    $content = Get-Content .\source\admintoolkit_servercfg\config.cpp
    $content = $content -Replace "ServerCommandPassword = ""(.*?)""","ServerCommandPassword = """""
    Set-Content .\source\admintoolkit_servercfg\config.cpp -Value $content;

    # SERVER: use cpbo to (re)create the admintoolkit.pbo file
    Write-Host "--- Generate admintoolkit_server.pbo and admintoolkit_servercfg.pbo"
    cpbo -y -p .\source\admintoolkit_server .\@AdminToolkitServer\addons\admintoolkit_server.pbo
	cpbo -y -p .\source\admintoolkit_servercfg .\@AdminToolkitServer\addons\admintoolkit_servercfg.pbo

    if(!$Sign) { $result = $host.ui.PromptForChoice("Confirm PBO signing", "Sign the Client PBO file?", $options, 0) }

    if($result -eq 0 -Or $Sign) {
        # CLIENT: build the bssign file for admintoolkit.pbo
        Write-Host "--- Signing client PBO"
        dssignfile $privateKeypath .\@AdminToolkit\addons\admintoolkit.pbo
        Write-Host "Done"
    }

    if(!$Install) { $result = $host.ui.PromptForChoice("Confirm Installation", "Install Addon into GameDir?", $options, 0) }

    if($result -eq 0 -Or $Install) {
        Write-Host "--- Installing client PBO (with bisign)"
        $arma3 = Get-Process arma3 -ErrorAction SilentlyContinue
        if (!$arma3) {
            New-Item -path $AddonFolder\addons -type directory -Force | Out-Null
            Copy-Item .\@AdminToolkit\mod.cpp -Destination $AddonFolder -Force
            Copy-Item .\@AdminToolkit\addons\admintoolkit.* -Destination $AddonFolder\addons -Force
            Write-Host "Done"
        } else {
            Write-Host -ForegroundColor Red "WARNING: Arma 3 is currently running - CLIENT PBO NOT UPDATED"
        }
    }
}

