/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */

private['_result'];
disableSerialization;
_result = [];

/**
 * LOWER BUTTONS
 * 
 * 1701 = Action 1
 * 1702 = Action 2
 * 1703 = Action 3
 * 1704 = Action 4
 * 1705 = Action 5
 * 1706 = Action 6
 * 1707 = Action 7
 * 1708 = Action 8
 */
 
ctrlSetText [1707,"Exile Spawn"];
buttonSetAction [1707, "systemChat 'Not yet implemented';"];

_result = "(configName _x find 'Exile' >= 0)" configClasses (configFile >> "CfgVehicles");

_result;