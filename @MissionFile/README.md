# Extend AdminToolkit through MissionFile

This folder is used to extend the AdminToolkit using additional files from the MissionFile.
All supported extensions are usually stored with `AdminToolkit_<MenuEntry>_<ModName>.sqf` in the `atk` folder.

## Example

Below is an example on how to enable an Addon feature (ExileMod) in MissionFile config.cpp

```
// Example: Extend "Vehicles" section in AdminToolkit through config.cpp located in MissionFile
class CfgAdminToolkitCustomMod {
	// Used to replace the top menu button text (optional)
	//AdminToolkit_MenuTitle[] = {"Players", "Vehicles", "Weapons", "AI", "Buildings", "Items"};
	
	// Used th ENABLE THE MOD from server side
	//AdminToolkit_ModEnable = "";
	
    //AdminToolkit_Mod_Players = "";
    AdminToolkit_Mod_Vehicles = "atk\AdminToolkit_Vehicles_Demo.sqf";
	//AdminToolkit_Mod_Weapons = "";
	//AdminToolkit_Mod_Ai = "";
	//AdminToolkit_Mod_Buildings = "";
    //AdminToolkit_Mod_Items = "";
};
```

Below is a simple example script on how to replace list and action buttons for the `Vehicles` section

```
// File: atk\AdminToolkit_Vehicles_Demo.sqf
private['_result'];
disableSerialization;

// _result returned the new list being added to GUI listbox
_result = [];

/** 
 * SEARCH
 *
 * 1801 = Search text
 * 1802 = Search button
 *
 * LISTBOX
 *
 * 1500 = Listbox
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

ctrlSetText [1701,"Demo 1"];
buttonSetAction [1701, "systemChat format['You have selected %1', lbData [1500, lbCurSel 1500]]"];

_result = "(configName _x find 'Hatchback' >= 0)" configClasses (configFile >> "CfgVehicles");

_result;
```