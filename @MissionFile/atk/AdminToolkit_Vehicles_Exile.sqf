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

if (['exile_getvehicle'] call AdminToolkit_hasPermission) then {
    [1707, "Exile Spawn", "['exile_getvehicle'] call AdminToolkit_buttonAction;"] call AdminToolkit_uiButton;
};

if (['exile_getmoney'] call AdminToolkit_hasPermission) then {
    [1708, "Exile Money", "[player, 'exile_getmoney', 10000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

_result = "(getText(_x >> 'VehicleClass') in ['ExileCars', 'ExileBikes', 'ExileChoppers','ExileBoats','ExilePlanes']) and (getNumber (_x >> 'scope') == 2)" configClasses (configFile >> "CfgVehicles");

_result;