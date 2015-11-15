/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
private['_controlId','_vehicles'];
// listbox control
_controlId = 1500;

lbClear _controlId;

// get all Exile vehicles
_vehicles = "(configName _x find 'Exile' >= 0)" configClasses (configFile >> "CfgVehicles");

// bind action buttons for players list
[1601] call admintoolkit_buttonEvents;

{
    lbAdd [_controlId, configName _x];
} forEach _vehicles;

true;