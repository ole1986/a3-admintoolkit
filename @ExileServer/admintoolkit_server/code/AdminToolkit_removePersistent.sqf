/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_section','_objectPos', '_pos', '_vectorDiff', '_index'];
_section = _this select 0;
_objectPos = _this select 1;

switch (_section) do {
    case "BUILDINGS": {
        if (isNil "_objectPos") then {
            AdminToolkit_Buildings deleteRange [0, count AdminToolkit_Buildings];
        } else {
            _index = 0;
            {
                _pos = _x select 1;
                _vectorDiff = _pos vectorDistance  _objectPos;
                
                if(_vectorDiff < 0.3) exitWith {
                    // remove object where difference is less than 0.3
                    diag_log format["[ADMINTOOLKIT]: '%1' removed from persistence", _x select 0];
                    AdminToolkit_Buildings deleteAt _index;
                };
                
                _index = _index + 1;
            } forEach AdminToolkit_Buildings;
        };
    };
    default { };
};