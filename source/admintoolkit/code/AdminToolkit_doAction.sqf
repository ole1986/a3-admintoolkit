/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
 /**
  * _action STRING what action
  * _params ARRAY array of parameters for the action
  *
  */
params['_action', '_params'];

private _tmp = '';

try {
    if(count _this < 1) then {
        throw 'AdminToolkit_doAction requires at least one parameter';
    };
    
    switch(_action) do {
        case 'message': {
            _tmp = ctrlText RscAdminToolkitParam_IDC;
            _params pushBack _tmp;
        };
        case 'messageall': {
            _tmp = ctrlText RscAdminToolkitParam_IDC;
            _params pushBack _tmp;
        };
        case 'spawn': {
            _tmp = player modelToWorld [0,2, (position player) select 2];
            _params pushBack _tmp;
        };
        case 'getweapon': {
            _tmp = _params select 0;
            _tmp = [_tmp] call AdminToolkit_weaponMagazine;

            _params pushBack _tmp;
        };
        case 'getammo': {
            _tmp = _params select 0;
            _tmp = [_tmp] call AdminToolkit_weaponMagazine;

            _params pushBack _tmp;
        };
    };
    
    if (!isNil "_params") then {
        [player, _action, _params] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
        systemChat format["Command '%1' executed", _action];
        AdminToolkit_LastAction = [_action, _params];
    } else {
        systemChat format["ERROR: No parameters for '%1'", _action];
    };
} catch {
    systemChat format['EXCEPTION: %1', _exception];
};