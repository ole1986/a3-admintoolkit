$steamPath = (Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Valve\Steam -Name SteamPath).SteamPath
$AddonFolder = $steamPath + "/steamapps/common/Arma 3"

if(!$steamPath) {
    Write-Host -ForegroundColor Red "No Steam installation found"
    Exit
}

Try
{
    Copy-Item -Recurse .\@AdminToolkit -Destination $AddonFolder -Force
    Write-Host ""
    Write-Host -ForegroundColor Green "Installation finished"
}
Catch
{
    Write-Host -ForegroundColor Red "Error: " $_.Exception.Message
}


