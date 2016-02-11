/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
private['_action', '_selection', '_tmp', '_tmp2'];
// is the action which should remotely be called
_action = _this select 0;
_selection = nil;

switch (_action) do
{
    case 'tp2pos':
    {
        _selection = _this select 1;
        systemChat format["Teleporting to %1", str _selection];
    };
    case 'givevehicle':
    {
		// selection = [vehicle, player name]
        _selection = [lbData [1500, lbCurSel 1500], AdminToolkit_selectedPlayer];
        systemChat format["Giving vehicle to %1", AdminToolkit_selectedPlayer];
    };
    case 'specstop': {
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
		//_tmp2 = screenToWorld [0.5,0.5];
		// get player position 2m in front with current player Z axis
		_tmp2 = player modelToWorld [0,2, (position player) select 2];
		
		systemChat format["spawn: %1 %2", _tmp, str _tmp2];
		// _tmp = Building, _tmp2 = position on ground player is looking at
		_selection = [_tmp, _tmp2];
	};
    case 'build': {
        _tmp = lbData [1500, lbCurSel 1500];
        [_tmp] call AdminToolkit_moveStart;
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