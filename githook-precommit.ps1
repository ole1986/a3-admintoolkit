$yes = New-Object System.Management.Automation.Host.ChoiceDescription "&Yes"
$no = New-Object System.Management.Automation.Host.ChoiceDescription "&No"

$options = [System.Management.Automation.Host.ChoiceDescription[]]($yes, $no)
$result = $host.ui.PromptForChoice("Confirm PBO generation", "Generate PBO files?", $options, 0)


if($result -eq 0) {
    # CLIENT: use cpbo to (re)create the admintoolkit.pbo file
    cpbo -y -p .\@AdminToolkit\addons\admintoolkit .\@AdminToolkit\addons\admintoolkit.pbo

    # SERVER: replace sensitive password with an empty string in server config.cpp
    $content = Get-Content .\@ExileServer\admintoolkit\config.cpp
    $content = $content -Replace "ServerCommandPassword = ""(.*?)""","ServerCommandPassword = """""
    Set-Content .\@ExileServer\admintoolkit\config.cpp -Value $content;

    # SERVER: use cpbo to (re)create the admintoolkit.pbo file
    cpbo -y -p .\@ExileServer\admintoolkit .\@ExileServer\admintoolkit.pbo

    $result = $host.ui.PromptForChoice("Confirm PBO signing", "Sign the Client PBO file?", $options, 0)
    if($result -eq 0) {
        # CLIENT: build the bssign file for admintoolkit.pbo
        dssignfile .\admintoolkit.bikey .\@AdminToolkit\addons\admintoolkit.pbo   
    }
}

