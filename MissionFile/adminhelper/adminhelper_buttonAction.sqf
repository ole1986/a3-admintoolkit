/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
private['_action', '_selection', '_tmp', '_tmp2'];
// is the action which should remotely be called
_action = _this select 0;

switch (_action) do
{
    case 'tp2pos':
    {
        _selection = _this select 1;
        systemChat format["Teleporting to %1", str _selection];
    };
    case 'givevehicle':
    {
        _selection = [lbText [1500, lbCurSel 1500], adminhelper_selectedPlayer];
        systemChat format["Giving vehicle to %1", adminhelper_selectedPlayer];
    };
    case 'godmode': {
        _selection = _this select 1;
        systemChat format["Godmode applies ONLY TO YOU: %1", str _selection];
    };
    case 'getweapon': {
        _tmp = lbText [1500, lbCurSel 1500];
        _tmp2 = [_tmp] call adminhelper_weaponMagazine;
        
        if ( (primaryWeapon  player) == _tmp) then { _tmp = ''; };
        if ( (secondaryWeapon player) == _tmp) then { _tmp = ''; };
        if ( (handgunWeapon  player) == _tmp) then { _tmp = ''; };
        
        // parameter 1: weapon class name or empty when already in inventory
        // parameter 2: compatible magazine
        _selection = [_tmp, _tmp2];
    };
    default 
    {
        _selection = lbText [1500, lbCurSel 1500];
        systemChat format["Calling %1 with param %2", _action, _selection];
    };
};

[player, _action, _selection] remoteExecCall ['AdminHelper_network_receiveRequest', 2];