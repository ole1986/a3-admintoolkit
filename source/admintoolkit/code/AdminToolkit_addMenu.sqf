/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
params['_title', '_ext'];
disableSerialization;

private _index = 0;
private _code = {};

_index = lbAdd [RscAdminToolkitMainMenu_IDC, _title];
// if extension parameter is set, load the file!
if(count _this > 1) then {
    _ext = _this select 1;
    // initialize the extension from atk folder
    _code = compileFinal preprocessFileLineNumbers format["atk\extension\%1.sqf", _ext];
    missionNamespace setVariable [format["AdminToolkit_%1", _ext], _code];
    missionNamespace setVariable [format["AdminToolkit_%1_loadDetails", _ext], ""];

    lbSetData [RscAdminToolkitMainMenu_IDC, _index, format["AdminToolkit_%1",_ext]];
};

_index;