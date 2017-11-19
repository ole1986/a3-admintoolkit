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
	['AdminToolkit_network_receiveRequest', 'x\admintoolkit_server\code\AdminToolkit_network_receiveRequest.sqf'],
	['AdminToolkit_network_fetchPlayer', 'x\admintoolkit_server\code\AdminToolkit_network_fetchPlayer.sqf'],
    ['AdminToolkit_saveProfile', 'x\admintoolkit_server\code\AdminToolkit_saveProfile.sqf'],
    ['AdminToolkit_savePersistent', 'x\admintoolkit_server\code\AdminToolkit_savePersistent.sqf'],
    ['AdminToolkit_removePersistent', 'x\admintoolkit_server\code\AdminToolkit_removePersistent.sqf'],
    ['AdminToolkit_loadProfile', 'x\admintoolkit_server\code\AdminToolkit_loadProfile.sqf'],
    ['AdminToolkit_godLoop', 'x\admintoolkit_server\code\AdminToolkit_godLoop.sqf'],
    ['AdminToolkit_showAAN', 'x\admintoolkit_server\code\AdminToolkit_showAAN.sqf']
];

diag_log "[ADMINTOOLKIT] Initializing";

true