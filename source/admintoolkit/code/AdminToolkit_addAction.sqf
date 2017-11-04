/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
params['_title', '_command', '_check'];
disableSerialization;

private _hasPerm = false;
private _index = 0;

if(!(isNil "_check")) then {
    // skip the permission check
    _hasPerm = true;
} else {
    // check the permission
    _hasPerm = [_command] call AdminToolkit_hasPermission;
};

if(_hasPerm) then {
    _index = lbAdd [RscAdminToolkitActionList_IDC, _title];
    lbSetData [RscAdminToolkitActionList_IDC, _index, _command];
};

_index;