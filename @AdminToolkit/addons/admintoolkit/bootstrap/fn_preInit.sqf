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
	['AdminToolkit_bindEvents', 'admintoolkit\code\AdminToolkit_bindEvents.sqf'],
	['AdminToolkit_buttonEvents', 'admintoolkit\code\AdminToolkit_buttonEvents.sqf'],
	['AdminToolkit_buttonAction', 'admintoolkit\code\AdminToolkit_buttonAction.sqf'],
	['AdminToolkit_listboxChanged', 'admintoolkit\code\AdminToolkit_listboxChanged.sqf'],
	['AdminToolkit_uiList', 'admintoolkit\code\AdminToolkit_uiList.sqf'],
	['AdminToolkit_uiButton', 'admintoolkit\code\AdminToolkit_uiButton.sqf'],
	['AdminToolkit_hasPermission', 'admintoolkit\code\AdminToolkit_hasPermission.sqf'],
	['AdminToolkit_weaponMagazine', 'admintoolkit\code\AdminToolkit_weaponMagazine.sqf'],
    ['AdminToolkit_moveStart', 'admintoolkit\code\AdminToolkit_moveStart.sqf'],
    ['AdminToolkit_moveThread', 'admintoolkit\code\AdminToolkit_moveThread.sqf'],
    ['AdminToolkit_moveStop', 'admintoolkit\code\AdminToolkit_moveStop.sqf']
];

// used for Addon modifications
if(isClass (missionConfigFile >> 'CfgAdminToolkitCustomMod')) then {
	{
		if(isText (missionConfigFile >> 'CfgAdminToolkitCustomMod' >> _x)) then 
		{
			_file = getText (missionConfigFile >> 'CfgAdminToolkitCustomMod' >> _x);
			_code = compileFinal preprocessFileLineNumbers _file;
			missionNamespace setVariable [_x, _code];
		};
	} forEach 
	[
		'AdminToolkit_Mod_Players',
		'AdminToolkit_Mod_Vehicles',
		'AdminToolkit_Mod_Weapons',
		'AdminToolkit_Mod_Custom',
		'AdminToolkit_Mod_Other',
		'AdminToolkit_Mod_Items'
	];
};

diag_log "AdminToolkit preInit";
true;