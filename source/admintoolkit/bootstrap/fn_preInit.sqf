/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal preprocessFileLineNumbers _file;

    missionNamespace setVariable [_function, _code];
}
forEach 
[
	['AdminToolkit_network_receiveResponse', 'admintoolkit\code\AdminToolkit_network_receiveResponse.sqf'],
	['AdminToolkit_initMenu','admintoolkit\code\AdminToolkit_initMenu.sqf' ],
	['AdminToolkit_bindKeyEvents', 'admintoolkit\code\AdminToolkit_bindKeyEvents.sqf'],	
	['AdminToolkit_loadActions', 'admintoolkit\code\AdminToolkit_loadActions.sqf'],
	['AdminToolkit_loadDetails', 'admintoolkit\code\AdminToolkit_loadDetails.sqf'],
	['AdminToolkit_addMenu', 'admintoolkit\code\AdminToolkit_addMenu.sqf'],
	['AdminToolkit_addParam', 'admintoolkit\code\AdminToolkit_addParam.sqf'],
	['AdminToolkit_doAction', 'admintoolkit\code\AdminToolkit_doAction.sqf'],
	['AdminToolkit_onActionChanged', 'admintoolkit\code\AdminToolkit_onActionChanged.sqf'],
	['AdminToolkit_onDetailChanged', 'admintoolkit\code\AdminToolkit_onDetailChanged.sqf'],
	['AdminToolkit_uiList', 'admintoolkit\code\AdminToolkit_uiList.sqf'],
	['AdminToolkit_addAction', 'admintoolkit\code\AdminToolkit_addAction.sqf'],
	['AdminToolkit_hasPermission', 'admintoolkit\code\AdminToolkit_hasPermission.sqf'],
	['AdminToolkit_weaponMagazine', 'admintoolkit\code\AdminToolkit_weaponMagazine.sqf'],
    ['AdminToolkit_moveStart', 'admintoolkit\code\AdminToolkit_moveStart.sqf'],
    ['AdminToolkit_moveThread', 'admintoolkit\code\AdminToolkit_moveThread.sqf'],
    ['AdminToolkit_moveStop', 'admintoolkit\code\AdminToolkit_moveStop.sqf'],
	['AdminToolkit_spectatePlayer', 'admintoolkit\code\AdminToolkit_spectatePlayer.sqf'],
	['AdminToolkit_toggleDetail', 'admintoolkit\code\AdminToolkit_toggleDetail.sqf']
];

diag_log "AdminToolkit preInit";
true;