/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

disableSerialization;

private _display = findDisplay 40000;
private _list = [];
private _displayName = '(unknown)';

// receive the selected index and name from the Main Menu combobox
private _menuIndex = lbCurSel RscAdminToolkitMainMenu_IDC;
private _menuName = lbText [RscAdminToolkitMainMenu_IDC, _menuIndex];
private _menuData = lbData [RscAdminToolkitMainMenu_IDC, _menuIndex];

AdminToolkit_MenuIndex = _menuIndex;

// ### Search filter
private _filter = ctrlText RscAdminToolkitEditAction_IDC;
if(_filter != "") then {
	// search filter is set, so reset the textbox
	ctrlSetText [RscAdminToolkitEditAction_IDC, ""];	
	// and tell user in systemChat its filtered view
	systemChat format["Searching for '%1' in %2", _filter, _menuName];	
};

AdminToolkit_Action = nil;

// clear listbox and selection
lbClear RscAdminToolkitActionList_IDC;
lbSetCurSel [RscAdminToolkitActionList_IDC, -1];

false call AdminToolkit_toggleDetail;

// Prepare the execution event used by the Run button event - overwritable by extensions
missionNamespace setVariable ['AdminToolkit_OnExecute', { [AdminToolkit_Action, AdminToolkit_Params] call AdminToolkit_doAction; }];

_menuName = toLower _menuName;

switch (_menuName) do {
	case "players": {
		_list = [
			["Send Message", "message"],
			["Send Message to ALL", "messageall"],
			["Give Ammo (primary)", "giveammo"],
			["TP To Player",'tp2player'],
			["TP to Me", 'tpplayer'],
			["Spec Player", 'specplayer'],
			["Godmode On", 'godmodeon'],
			["Godmode Off", 'godmodeoff'],
			["Kick Player", 'kickplayer'],
			["Ban Player", 'banplayer']
		];
	};
	case "vehicles": {
		_list = [
			["Spawn at Me",'getvehicle'],
			["Spawn at Player", 'givevehicle'],
			["Remove Nearby", 'removevehicle']
		];
	};
	case "weapons": {
		_list = [
			["Get Weapon", 'getweapon'],
			["Get Ammo", 'getammo']
		];
	};
	case "buildings": {
		_list = [
			["Build (temporary)", 'build'],
			["Build (persistent)", 'buildpers'],
			["Remove (nearby)", "buildremove"],
			["Status", 'buildinfopersistent'],
			["Save Persistent", 'savepersistent'],
			["Clear Persistent", 'clearpersistent']
		];
	};
	case "items": {
		_list = [
			["Get Item", 'getitem'],
			["Spawn", 'spawn']
		];
	};
	default {
		systemChat format["Verifing mod command for %1 (%2)", _menuName, _menuData];
		if(!(isNil "_menuData")) then {
			_list = call (missionNamespace getVariable[_menuData, nil]);
		};
		
	};
};

{
	_displayName = _x select 0;

	if((_filter != "") and (toLower _displayName find _filter >= 0)) then {
		_x call AdminToolkit_addAction;
	} else {
		if(_filter == "") then { 
			_x call AdminToolkit_addAction;
		};
	};
} forEach _list;

true;