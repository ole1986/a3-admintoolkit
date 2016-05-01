/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_section', '_value', '_pos', '_result'];
_section = _this select 0;
_value = _this select 1;

switch (_section) do {
    case "BUILDINGS": {
        if ((typeName _value == "ARRAY") and (count _value == 3) ) then {
            diag_log format["[ADMINTOOLKIT] Saving '%1' into '%2' ", str _value, _section];
            AdminToolkit_Buildings pushBackUnique _value;
        }
    };
    default { };
};