/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
private['_controlId', '_filter', '_display','_listboxId', '_actionCode', '_list'];
disableSerialization;
_display = findDisplay 40000;
_listboxId = 1500;
_list = [];
_filter = "";
// open players by default
_controlId = 1600;

// get the IDC from the button being pressed
if(count _this > 0) then {
	_controlId = _this select 0;
	if(count _this > 1) then { _filter = _this select 1; };
} else {
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
 
// clear lower buttons first when main buttons have been clicked (not the search)
if(_controlId >= 1600 && _controlId <= 1699) then {
	for "_i" from 1701 to 1708 do
	{
		ctrlSetText[_i, ""];
		buttonSetAction [_i, ""];
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
		(_display displayCtrl _listboxId) ctrlSetEventHandler ['LBSelChanged', "AdminToolkit_selectedPlayer = (_this select 0) lbText (_this select 1); ctrlSetText [1803, 'Selected Player: ' + AdminToolkit_selectedPlayer];"];
		
        ctrlSetText [1701,"TP to Player"];
        buttonSetAction [1701, "['tp2player']" + _actionCode];
        ctrlSetText [1704, "TP to Me"];
        buttonSetAction [1704, "['tpplayer']" + _actionCode];
        
        ctrlSetText [1702, "Spec Player"];
        buttonSetAction [1702, "['specplayer']" + _actionCode];
        ctrlSetText [1705, "Stop Spec"];
        buttonSetAction [1705, "['specstop']" + _actionCode];
		
		ctrlSetText [1703, "Godmode On"];
        buttonSetAction [1703, "['godmodeon']" + _actionCode];
        ctrlSetText [1706, "Godmode Off"];
        buttonSetAction [1706, "['godmodeoff']" + _actionCode];
		
		ctrlSetText [1707, "Kick Player"];
        buttonSetAction [1707, "['kickplayer']" + _actionCode];
		
		ctrlSetText [1708, "Ban Player"];
        buttonSetAction [1708, "['banplayer']" + _actionCode];
	};
    // Vehicles
    case 1601:
    {
		ctrlSetText [1701,"Spawn at Me"];
        buttonSetAction [1701, "['getvehicle']" + _actionCode];
        
        ctrlSetText [1702,"Spawn at Player"];
        buttonSetAction [1702, "['givevehicle']" + _actionCode];
		
		// get all vehicles
		if(!(isNil {missionNamespace getVariable "AdminToolkit_Mod_Vehicles"}) ) then 
		{
			_list = [] call AdminToolkit_Mod_Vehicles;
		} else {
			_list = "getText(_x >> 'VehicleClass') in ['Car', 'Armored', 'Air']" configClasses (configFile >> "CfgVehicles");
		};
        
		[_listboxId, _list, _filter] call AdminToolkit_addItems;
    };
    // Weapons
    case 1602:
    {
		ctrlSetText [1701,"Get Weapon"];
        buttonSetAction [1701, "['getweapon']" + _actionCode];
		
		ctrlSetText [1702,"Get Ammo"];
        buttonSetAction [1702, "['getammo']" + _actionCode];
		
		_list = "((getNumber(_x >> 'Type') > 0) and (getNumber(_x >> 'Type') <= 4) and (configName _x find '_Base' <= 0) and (configName _x find '_base' <= 0))" configClasses (configFile >> "CfgWeapons");

		[_listboxId, _list, _filter] call AdminToolkit_addItems;
    };
	// AI
	case 1603: 
	{
		if(!(isNil {missionNamespace getVariable "AdminToolkit_Mod_Ai"})) then 
		{
			_list = [] call AdminToolkit_Mod_Ai;
		} else {
			_list = [];
		};
		
		[_listboxId, _list, _filter] call AdminToolkit_addItems;
	};
	// Buildings
	case 1604: 
	{
		if(!(isNil {missionNamespace getVariable "AdminToolkit_Mod_Buildings"})) then 
		{
			_list = [] call AdminToolkit_Mod_Buildings;
		} else {
			_list = "(getText(_x >> 'VehicleClass') in ['Objects', 'Structures','Training', 'Structures_Industrial','Military']) and (getNumber (_x >> 'scope') == 2)" configClasses (configFile >> "CfgVehicles");
		};
		
		[_listboxId, _list, _filter] call AdminToolkit_addItems;
	};
	// Items
	case 1605:
	{
		ctrlSetText [1701,"Get Item"];
        buttonSetAction [1701, "['getitem']" + _actionCode];
		
		if(!(isNil {missionNamespace getVariable "AdminToolkit_Mod_Items"})) then 
		{
			_list = [] call AdminToolkit_Mod_Items;
		} else {
			_list = "getNumber(_x >> 'Type') == 256" configClasses (configFile >> "CfgMagazines");
		};
		
		[_listboxId, _list, _filter] call AdminToolkit_addItems;
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