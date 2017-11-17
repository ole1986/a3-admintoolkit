/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
{
    private _code = '';
    private _function = _x select 0;
    private _file = _x select 1;

    _code = compileFinal preprocessFileLineNumbers _file;

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['AdminToolkit_network_receiveResponse', 'x\admintoolkit\code\AdminToolkit_network_receiveResponse.sqf'],
	['AdminToolkit_initMenu','x\admintoolkit\code\AdminToolkit_initMenu.sqf' ],
	['AdminToolkit_bindKeyEvents', 'x\admintoolkit\code\AdminToolkit_bindKeyEvents.sqf'],	
	['AdminToolkit_loadActions', 'x\admintoolkit\code\AdminToolkit_loadActions.sqf'],
	['AdminToolkit_loadDetails', 'x\admintoolkit\code\AdminToolkit_loadDetails.sqf'],
	['AdminToolkit_addMenu', 'x\admintoolkit\code\AdminToolkit_addMenu.sqf'],
	['AdminToolkit_addParam', 'x\admintoolkit\code\AdminToolkit_addParam.sqf'],
	['AdminToolkit_doAction', 'x\admintoolkit\code\AdminToolkit_doAction.sqf'],
	['AdminToolkit_onActionChanged', 'x\admintoolkit\code\AdminToolkit_onActionChanged.sqf'],
	['AdminToolkit_onDetailChanged', 'x\admintoolkit\code\AdminToolkit_onDetailChanged.sqf'],
	['AdminToolkit_uiList', 'x\admintoolkit\code\AdminToolkit_uiList.sqf'],
	['AdminToolkit_addAction', 'x\admintoolkit\code\AdminToolkit_addAction.sqf'],
	['AdminToolkit_hasPermission', 'x\admintoolkit\code\AdminToolkit_hasPermission.sqf'],
	['AdminToolkit_weaponMagazine', 'x\admintoolkit\code\AdminToolkit_weaponMagazine.sqf'],
    ['AdminToolkit_moveStart', 'x\admintoolkit\code\AdminToolkit_moveStart.sqf'],
    ['AdminToolkit_moveThread', 'x\admintoolkit\code\AdminToolkit_moveThread.sqf'],
    ['AdminToolkit_moveStop', 'x\admintoolkit\code\AdminToolkit_moveStop.sqf'],
	['AdminToolkit_spectatePlayer', 'x\admintoolkit\code\AdminToolkit_spectatePlayer.sqf'],
	['AdminToolkit_toggleDetail', 'x\admintoolkit\code\AdminToolkit_toggleDetail.sqf']
];

diag_log "AdminToolkit preInit";
true;