/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

params['_section', '_create'];

private _result = profileNamespace getVariable [format["ATK_PERSISTENT_%1", _section], []];

if(_create) then {
    switch (_section) do {
        case "BUILDINGS": {
            {
                private _name = _x select 0;
                private _pos = _x select 1;
                private _rot = _x select 2;
                
                diag_log format["[ADMINTOOLKIT] createVehicle '%1' at pos '%2'", _name, str _pos];
                private _obj = createVehicle [_name, _pos, [], 0, "CAN_COLLIDE"];
                _obj setVariable ["ATK_IsPersistent", true];
                _obj setVariable ["BIS_enableRandomization", false];
                _obj setDir _rot;
                _obj setPosATL _pos;
            } forEach _result; 
        };
        default { };
    };
};

_result;