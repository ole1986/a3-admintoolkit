/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_filter','_display','_menuIndex', '_menuName', '_list'];
disableSerialization;
_display = findDisplay 40000;

// receive the selected index and name from the Main Menu combobox
_menuIndex = lbCurSel RscAdminToolkitMainMenu_IDC;
_menuName = lbText [RscAdminToolkitMainMenu_IDC, _menuIndex];

// ### Search filter
_filter = ctrlText RscAdminToolkitSearch_IDC;
if(_filter != "") then {
	// search filter is set, so reset the textbox
	ctrlSetText [RscAdminToolkitSearch_IDC, ""];	
	// and tell user in systemChat its filtered view
	systemChat format["Searching for '%1' in %2", _filter, _menuName];	
};

// clear listbox and selection event
lbClear RscAdminToolkitList_IDC;
// clear the action menu as well
lbClear RscAdminToolkitActionMenu_IDC;
// clear on selection event for the list
(_display displayCtrl RscAdminToolkitList_IDC) ctrlSetEventHandler ['LBSelChanged', ''];

(_display displayCtrl RscAdminToolkitInfo_IDC) ctrlSetStructuredText parseText format["Menu %1 selected", _menuName];

_menuName = toLower _menuName;

switch (_menuName) do {
	case "players": {
		// get player list from server while doing a receiveRequest
		[player, 'getplayers'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];

		// setup the event onLbSelChanged for the listbox to globally select a player
		(_display displayCtrl RscAdminToolkitList_IDC) ctrlSetEventHandler ['LBSelChanged', "[RscAdminToolkitList_IDC, _this, 'player'] call AdminToolkit_listboxChanged"];

		{
			if ([_x select 1] call AdminToolkit_hasPermission) then {
				_x call AdminToolkit_addAction;
			};
		} forEach [
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
		{
			if ([_x select 1] call AdminToolkit_hasPermission) then {
				_x call AdminToolkit_addAction;
			};
		} forEach [
			["Spawn at Me",'getvehicle'],
			["Spawn at Player", 'givevehicle']
		];

		_list = "getText(_x >> 'VehicleClass') in ['Car', 'Armored', 'Air']" configClasses (configFile >> "CfgVehicles");
		[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
	};
	case "weapons": {
		{
			if ([_x select 1] call AdminToolkit_hasPermission) then {
				_x call AdminToolkit_addAction;
			};
		} forEach [
			["Get Weapon", 'getweapon'],
			["Get Ammo", 'getammo']
		];

		_list = "((getNumber(_x >> 'Type') > 0) and (getNumber(_x >> 'Type') <= 4) and (configName _x find '_Base' <= 0) and (configName _x find '_base' <= 0))" configClasses (configFile >> "CfgWeapons");
		[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
	};
	case "buildings": {
		{
			if ([_x select 1] call AdminToolkit_hasPermission) then {
				_x call AdminToolkit_addAction;
			};
		} forEach [
			["Build (temporary)", 'build'],
			["Build (persistent)", 'buildpers'],
			["Remove", "buildremove"],
			["Status", 'buildinfopersistent'],
			["Save Persistent", 'savepersistent'],
			["Clear Persistent", 'clearpersistent']
		];

		// use the listbox event to display more details about the build when selected
		(_display displayCtrl RscAdminToolkitList_IDC) ctrlSetEventHandler ['LBSelChanged', "[RscAdminToolkitList_IDC, _this, 'buildings'] call AdminToolkit_listboxChanged"];

		_list = "(configName _x isKindOf 'Building') and !(configName _x isKindOf 'ReammoBox') and (getNumber(_x >> 'scope') == 2)" configClasses (configFile>>"CfgVehicles");
		[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
	};
	case "other": {
		{
			if ([_x select 1] call AdminToolkit_hasPermission) then {
				_x call AdminToolkit_addAction;
			};
		} forEach [
			["Spawn", 'spawn']
		];

		_list ="configName _x isKindOf 'ReammoBox' and getNumber(_x >> 'scope') == 2" configClasses (configFile>>"CfgVehicles");
		[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
	};
	case "items": {
		{
			if ([_x select 1] call AdminToolkit_hasPermission) then {
				_x call AdminToolkit_addAction;
			};
		} forEach [
			["Get Item", 'getitem']
		];

		_list = "(getNumber(_x >> 'Type') == 256) and (getNumber(_x >> 'scope') == 2)" configClasses (configFile >> "CfgMagazines");
		[RscAdminToolkitList_IDC, _list, _filter] call AdminToolkit_uiList;
	};
	default {
		systemChat "Invalid menu request";
	};
};

true;