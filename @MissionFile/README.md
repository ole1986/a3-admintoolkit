# Extending AdminToolkit features

This folder is used to extend the AdminToolkit using additional files from the MissionFile.
All supported extensions are usually stored as `AdminToolkit_<MenuEntry>_<ModName>.sqf` in the `atk` folder.

## Overwrite menu

Below is an example on how to imeplement a new feature into the Vehicle section
The below class it is stored in the description.ext or config.cpp of your MissionFile

```
// Example: Extend "Vehicles" section in AdminToolkit through config.cpp located in MissionFile
class CfgAdminToolkitCustomMod {
	// Used to replace the top menu button text (optional)
	//AdminToolkit_MenuTitle[] = {"Players", "Vehicles", "Weapons", "AI", "Buildings", "Items"};
	
	// Used for server-side execution
	//AdminToolkit_ModEnable = "";
	
	//AdminToolkit_Mod_Players = "";
	AdminToolkit_Mod_Vehicles = "atk\AdminToolkit_Vehicles_Demo.sqf";
	//AdminToolkit_Mod_Weapons = "";
	//AdminToolkit_Mod_Custom = "";
	//AdminToolkit_Mod_Other = "";
	//AdminToolkit_Mod_Items = "";
};
```

By adding `AdminToolkit_Mod_Vehicles = "atk\AdminToolkit_Vehicles_Demo.sqf";` the script `AdminToolkit_Vehicles_Demo.sqf` is being called when user pressed the `Vehicles` button.

Below is an example of such script

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

## Server-side execution

(soon)
