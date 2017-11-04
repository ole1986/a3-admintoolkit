/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
params['_section','_objectPos'];

private _index = 0;

switch (_section) do {
    case "BUILDINGS": {
        if (isNil "_objectPos") then {
            AdminToolkit_Buildings deleteRange [0, count AdminToolkit_Buildings];
        } else {
            _index = 0;
            {
                private _pos = _x select 1;
                private _vectorDiff = _pos vectorDistance  _objectPos;
                
                if(_vectorDiff < 0.3) exitWith {
                    // remove object where difference is less than 0.3
                    diag_log format["[ADMINTOOLKIT]: Removed '%1' removed from persistence", str _x];
                    AdminToolkit_Buildings deleteAt _index;
                };
                
                _index = _index + 1;
            } forEach AdminToolkit_Buildings;
        };
    };
    default { };
};