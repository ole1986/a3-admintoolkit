/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private _code = '';

{
    private _function = _x select 0;
    private _file = _x select 1;
	
    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['AdminToolkit_network_receiveRequest', 'admintoolkit_server\code\AdminToolkit_network_receiveRequest.sqf'],
	['AdminToolkit_network_fetchPlayer', 'admintoolkit_server\code\AdminToolkit_network_fetchPlayer.sqf'],
    ['AdminToolkit_saveProfile', 'admintoolkit_server\code\AdminToolkit_saveProfile.sqf'],
    
    ['AdminToolkit_savePersistent', 'admintoolkit_server\code\AdminToolkit_savePersistent.sqf'],
    ['AdminToolkit_removePersistent', 'admintoolkit_server\code\AdminToolkit_removePersistent.sqf'],
    ['AdminToolkit_loadProfile', 'admintoolkit_server\code\AdminToolkit_loadProfile.sqf']
];

diag_log "[ADMINTOOLKIT] Initializing";

true