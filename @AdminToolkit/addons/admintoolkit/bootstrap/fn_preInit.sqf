/**
 * AdminToolkit - preInit
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
	['AdminToolkit_bindEvents', 'admintoolkit\code\AdminToolkit_bindEvents.sqf'],
	['AdminToolkit_buttonEvents', 'admintoolkit\code\AdminToolkit_buttonEvents.sqf'],
	['AdminToolkit_buttonAction', 'admintoolkit\code\AdminToolkit_buttonAction.sqf'],
	['AdminToolkit_weaponMagazine', 'admintoolkit\code\AdminToolkit_weaponMagazine.sqf']
];

diag_log "AdminToolkit preInit";
true;