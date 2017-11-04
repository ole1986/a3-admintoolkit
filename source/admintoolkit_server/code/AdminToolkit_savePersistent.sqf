/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
params ['_section', '_value'];

switch (_section) do {
    case "BUILDINGS": {
        if (typeName _value == "ARRAY" ) then {
            diag_log format["[ADMINTOOLKIT] Saving '%1' to '%2'",str _value];
            AdminToolkit_Buildings pushBackUnique _value;
        }
    };
    default { };
};