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
 * LOWER BUTTONS IDC
 *
 * ----------------------
 * | 1701 | 1702 | 1703 |
 * ----------------------
 * | 1704 | 1705 | 1706 |
 * ----------------------
 * ----------  ----------
 * |  1707  |  |  1708  |
 * ----------  ----------
 *
 */

if (['exile_getvehicle'] call AdminToolkit_hasPermission) then {
    [1707, "Exile Spawn", "['exile_getvehicle'] call AdminToolkit_buttonAction;"] call AdminToolkit_uiButton;
};

if (['exile_delvehicle'] call AdminToolkit_hasPermission) then {
    [1708, "Exile Remove", "[player, 'exile_delvehicle', cursorObject] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

if (['exile_getmoney'] call AdminToolkit_hasPermission) then {
    [1704, "ExileMoney 10K", "[player, 'exile_getmoney', 10000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
    [1706, "ExileRespect 1K", "[player, 'exile_getscore', 1000] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];"] call AdminToolkit_uiButton;
};

_result = "(getText(_x >> 'VehicleClass') in ['ExileCars', 'ExileBikes', 'ExileChoppers','ExileBoats','ExilePlanes']) and (getNumber (_x >> 'scope') == 2)" configClasses (configFile >> "CfgVehicles");

_result;