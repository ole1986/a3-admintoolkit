/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_controlId', '_filter', '_display','_listboxId', '_actionCode', '_list'];
disableSerialization;
_display = findDisplay 40000;
_listboxId = 1500;
_list = [];
_filter = "";
// open players by default
_controlId = 0;

// get the IDC from the button being pressed
if(count _this > 0) then {
	_controlId = _this select 0;
	if(count _this > 1) then { _filter = _this select 1; };
} else {
	(_display displayCtrl 1803) ctrlSetStructuredText parseText "<t color='#FF0066'>Click on one of the buttons to open the section</t>";
	// initial call when player pressed F2 keys
	if(isClass(missionConfigFile >> 'CfgAdminToolkitCustomMod')) then {
		if(isArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'AdminToolkit_MenuTitle')) then {
			_list = getArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'AdminToolkit_MenuTitle');
			for "_i" from 1600 to 1605 do
			{
				if((_list select _i) != '') then 
				{
					ctrlSetText[_i, _list select _i];
				};
			};
		};
	};
};

/** 
 * UPPER BUTTONS
 *
 * 1600 = Player (default)
 * 1601 = Vehicles
 * 1602 = Weapons
 * 1603 = Mod 1
 * 1604 = Mod 2
 * 1605 = Mod 3
 *
 * SEARCH
 *
 * 1801 = Search text
 * 1802 = Search button
 * 
 * LOWER BUTTONS
 * 
 * 1701 = Action 1
 * 1702 = Action 2
 * 1703 = Action 3
 * 1704 = Action 4
 * 1705 = Action 5
 * 1706 = Action 6
 * 1707 = Action 7
 * 1708 = Action 8
 */
 
// clear lower buttons first when main buttons have been clicked (but not the search)
if((_controlId >= 1600 && _controlId <= 1699) or (_controlId == 0)) then {
	for "_i" from 1701 to 1708 do
	{
		// used to hide the buttons
		[_i, nil] call AdminToolkit_uiButton;
	};
	
	AdminToolkit_selectedMenu = _controlId;
};

// clear listbox and selection event
lbClear _listboxId;
(_display displayCtrl _listboxId) ctrlSetEventHandler ['LBSelChanged', ''];

_actionCode = ' call AdminToolkit_buttonAction;';
 
switch (_controlId) do
{
    // Players
    case 1600: 
	{
		[player, 'getplayers'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
		
		// get the listbox control to add change event for selected player
		(_display displayCtrl _listboxId) ctrlSetEventHandler ['LBSelChanged', "[1500, _this, 'player'] call AdminToolkit_listboxChanged"];
		
		{
			if ([_x select 2] call AdminToolkit_hasPermission) then {
				[_x select 0, _x select 1, format["['%1']%2", _x select 2, _actionCode] ] call AdminToolkit_uiButton;
			};
		} forEach [
			[1701, "TP To Player",'tp2player'],
			[1704, "TP to Me", 'tpplayer'],
			[1702, "Spec Player", 'specplayer'],
			/*[1705, "Stop Spec", 'specstop'],*/
			[1703, "Godmode On", 'godmodeon'],
			[1706, "Godmode Off", 'godmodeoff'],
			[1707, "Kick Player", 'kickplayer'],
			[1708, "Ban Player", 'banplayer']
		];
	};
    // Vehicles
    case 1601:
    {
		{
			if ([_x select 2] call AdminToolkit_hasPermission) then {
				[_x select 0, _x select 1, format["['%1']%2", _x select 2, _actionCode] ] call AdminToolkit_uiButton;
			};
		} forEach [
			[1701, "Spawn at Me",'getvehicle'],
			[1702, "Spawn at Player", 'givevehicle']
		];
		// get all vehicles
		if(!(isNil {missionNamespace getVariable "AdminToolkit_Mod_Vehicles"}) ) then 
		{
			_list = [] call AdminToolkit_Mod_Vehicles;
		} else {
			_list = "getText(_x >> 'VehicleClass') in ['Car', 'Armored', 'Air']" configClasses (configFile >> "CfgVehicles");
		};
        
		[_listboxId, _list, _filter] call AdminToolkit_uiList;
    };
    // Weapons
    case 1602:
    {
		{
			if ([_x select 2] call AdminToolkit_hasPermission) then {
				[_x select 0, _x select 1, format["['%1']%2", _x select 2, _actionCode] ] call AdminToolkit_uiButton;
			};
		} forEach [
			[1707, "Get Weapon", 'getweapon'],
			[1708, "Get Ammo", 'getammo']
		];
		
        // get all weapons
		if(!(isNil {missionNamespace getVariable "AdminToolkit_Mod_Weapons"}) ) then
        {
            _list = [] call AdminToolkit_Mod_Weapons;
        } else {
            _list = "((getNumber(_x >> 'Type') > 0) and (getNumber(_x >> 'Type') <= 4) and (configName _x find '_Base' <= 0) and (configName _x find '_base' <= 0))" configClasses (configFile >> "CfgWeapons");
        };

		[_listboxId, _list, _filter] call AdminToolkit_uiList;
    };
	// Buildings
	case 1603: 
	{
		{
			if ([_x select 2] call AdminToolkit_hasPermission) then {
				[_x select 0, _x select 1, format["['%1']%2", _x select 2, _actionCode] ] call AdminToolkit_uiButton;
			};
		} forEach [
			[1701, "Build", 'build'],
			[1704, "Pers. Build", 'buildpers'],
			[1703, "Remove", "buildremove"],
			[1706, "Status", 'buildinfopersistent'],
			[1707, "Save Persistent", 'savepersistent'],
			[1708, "Clear Persistent", 'clearpersistent']
		];
		
		(_display displayCtrl _listboxId) ctrlSetEventHandler ['LBSelChanged', "[1500, _this, 'building'] call AdminToolkit_listboxChanged"];
	
		if(!(isNil {missionNamespace getVariable "AdminToolkit_Mod_Custom"})) then 
		{
			_list = [] call AdminToolkit_Mod_Custom;
		} else {
			_list = "(configName _x isKindOf 'Building') and !(configName _x isKindOf 'ReammoBox') and (getNumber(_x >> 'scope') == 2)" configClasses (configFile>>"CfgVehicles");
		};
		
		[_listboxId, _list, _filter] call AdminToolkit_uiList;
	};
	// Item Vehicles or whatever
	case 1604: 
	{
		{
			if ([_x select 2] call AdminToolkit_hasPermission) then {
				[_x select 0, _x select 1, format["['%1']%2", _x select 2, _actionCode] ] call AdminToolkit_uiButton;
			};
		} forEach [
			[1707, "Spawn", 'spawn']
		];
			
		if(!(isNil {missionNamespace getVariable "AdminToolkit_Mod_Other"})) then 
		{
			_list = [] call AdminToolkit_Mod_Other;
		} else {
			_list ="configName _x isKindOf 'ReammoBox' and getNumber(_x >> 'scope') == 2" configClasses (configFile>>"CfgVehicles");
		};
		
		// backpacks, etc...
		// _list ="configName _x isKindOf 'Bag_Base' and getNumber(_x >> 'scope') == 2" configClasses (configFile>>"CfgVehicles");
		
		[_listboxId, _list, _filter] call AdminToolkit_uiList;
	};
	// Items
	case 1605:
	{
		{
			if ([_x select 2] call AdminToolkit_hasPermission) then {
				[_x select 0, _x select 1, format["['%1']%2", _x select 2, _actionCode] ] call AdminToolkit_uiButton;
			};
		} forEach [
			[1707, "Get Item", 'getitem']
		];
		
		if(!(isNil {missionNamespace getVariable "AdminToolkit_Mod_Items"})) then 
		{
			_list = [] call AdminToolkit_Mod_Items;
		} else {
			// 256 = WeaponSlotItem, 2 = only public classes
			_list = "(getNumber(_x >> 'Type') == 256) and (getNumber(_x >> 'scope') == 2)" configClasses (configFile >> "CfgMagazines");
		};
		
		[_listboxId, _list, _filter] call AdminToolkit_uiList;
	};
	// Search
	case 1802:
	{
		// get the text from search input
		_list = ctrlText 1801;
		ctrlSetText [1801, ""];
		systemChat format["Searching '%1' in %2", _list, str AdminToolkit_selectedMenu];
		[AdminToolkit_selectedMenu, _list] call AdminToolkit_buttonEvents;
	};
};

true;