/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_action', '_selection', '_tmp', '_tmp2'];
// is the action which should remotely be called
_action = _this select 0;
_selection = nil;

try {
    switch (_action) do
    {
        case 'tp2pos':
        {
            _selection = _this select 1;
        };
        case 'givevehicle':
        {
            if(AdminToolkit_selectedPlayer == '') then { throw "No player selected"; };
            
            _selection = [lbData [1500, lbCurSel 1500], AdminToolkit_selectedPlayer];
        };
        case 'specstop': {
            if(AdminToolkit_selectedPlayer == '') then { throw "No player selected"; };
            
            _selection = AdminToolkit_selectedPlayer;
            admintoolkit_specCam cameraEffect ["terminate","back"];
            camDestroy admintoolkit_specCam;
            admintoolkit_specCam = nil;
        };
        case 'getweapon': {
            _tmp = lbData [1500, lbCurSel 1500];
            _tmp2 = [_tmp] call AdminToolkit_weaponMagazine;
                    
            // parameter 1: weapon class name or empty when already in inventory
            // parameter 2: compatible magazine
            _selection = [_tmp, _tmp2];
        };
        case 'getammo': {
            _tmp = lbData [1500, lbCurSel 1500];
            _tmp2 = [_tmp] call AdminToolkit_weaponMagazine;
            
            // parameter 1: compatible magazine
            _selection = [_tmp2];
        };
        case 'spawn': {
            _tmp = lbData [1500, lbCurSel 1500];
            _tmp2 = player modelToWorld [0,2, (position player) select 2];
            
            systemChat format["spawn: %1 %2", _tmp, str _tmp2];
            _selection = [_tmp, _tmp2];
        };
        default 
        {
            _selection = lbData [1500, lbCurSel 1500];
        };
    };

    if !(isNil "_selection") then {
        systemChat format["receiveRequest: %1 with params %2", _action, str _selection];
        [player, _action, _selection] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
    };
} catch {
    systemChat format['EXCEPTION: %1', _exception];
};