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
	['AdminToolkit_addItems', 'admintoolkit\code\AdminToolkit_addItems.sqf'],
	['AdminToolkit_weaponMagazine', 'admintoolkit\code\AdminToolkit_weaponMagazine.sqf']
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
		'AdminToolkit_Mod_Ai',
		'AdminToolkit_Mod_Other',
		'AdminToolkit_Mod_Items'
	];
};

diag_log "AdminToolkit preInit";
true;