/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */

private['_result'];
disableSerialization;
_result = [];

/** 
 * SEARCH
 *
 * 1801 = Search text
 * 1802 = Search button
 *
 * LISTBOX
 *
 * 1500 = Listbox
 *
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
buttonSetAction [1707, "['exile_getvehicle'] call AdminToolkit_buttonAction;"];

ctrlSetText [1708,"Exile Money"];
buttonSetAction [1708, "[player, 'exile_getmoney', 10000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"];

_result = "(getText(_x >> 'VehicleClass') in ['ExileCars', 'ExileBikes', 'ExileChoppers','ExileBoats','ExilePlanes']) and (getNumber (_x >> 'scope') == 2)" configClasses (configFile >> "CfgVehicles");

_result;