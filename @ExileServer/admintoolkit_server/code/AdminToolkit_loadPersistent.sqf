/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_section', '_create', '_result', '_name', '_pos', '_rot', '_obj'];
_section = _this select 0;
_create = _this select 1;

diag_log format["[ADMINTOOLKIT] Syncing '%1'", _section];

_result = profileNamespace getVariable [format["ATK_PERSISTENT_%1", _section], []];

if (_create) then {
    switch (_section) do {
        case "BUILDINGS": {
            {
                _name = _x select 0;
                _pos = _x select 1;
                _rot = _x select 2;
                
                if(_create) then {
                    diag_log format["[ADMINTOOLKIT-DEBUG] CreateVehicle '%1'", _name];
                    _obj = createVehicle [_name, _pos, [], 0, "NONE"];
                    _obj setVariable ["BIS_enableRandomization", false];
                    _obj setDir _rot;
                };
            } forEach _result; 
        };
        default { };
    };
};

_result;