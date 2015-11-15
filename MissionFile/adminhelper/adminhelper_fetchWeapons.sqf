/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
private['_controlId','_weapons', '_weaponClass', '_weaponType'];
// listbox control
_controlId = 1500;

lbClear _controlId;

// fetch all default weapons from the CfgWeapons class
//_weapons = "(configName _x find 'Exile' >= 0)" configClasses (configFile >> "CfgWeapons");
_weapons = "((configName _x find '_Base' <= 0) and (configName _x find '_base' <= 0))" configClasses (configFile >> "CfgWeapons");

// bind action buttons for players list
[1602] call adminhelper_buttonEvents;

{
    _weaponClass = configName _x;
    _weaponType = getNumber (configFile >> "CfgWeapons" >> _weaponClass >> "Type");
    if (_weaponType > 0 and _weaponType <= 4) then {
        lbAdd [_controlId, _weaponClass];
    };
} forEach _weapons;

true;