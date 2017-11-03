/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_action', '_selection', '_tmp'];

try {
    if(count _this < 1) then {
        throw 'AdminToolkit_doAction requires at least one parameter';
    };
    
    _action = _this select 0; // Example: message
    _selection = _this select 1; // Example: ["2:13013","Hello World"]   

    switch(_action) do {
        case 'message': {
            _tmp = ctrlText RscAdminToolkitParam_IDC;
            _selection pushBack _tmp;
        };
        case 'messageall': {
            _tmp = ctrlText RscAdminToolkitParam_IDC;
            _selection pushBack _tmp;
        };
        case 'getweapon': {
            _tmp = _selection select 0;
            _tmp = [_tmp] call AdminToolkit_weaponMagazine;

            _selection pushBack _tmp;
        };
        case 'getammo': {
            _tmp = _selection select 0;
            _tmp = [_tmp] call AdminToolkit_weaponMagazine;

            _selection = [_tmp];
        };
    };
    
    if (!isNil "_selection") then {
        [player, _action, _selection] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
        systemChat format["Command '%1' executed", _action];
        AdminToolkit_LastAction = [_action, _selection];
    } else {
        systemChat format["ERROR: No parameters for '%1'", _action];
    };
} catch {
    systemChat format['EXCEPTION: %1', _exception];
};