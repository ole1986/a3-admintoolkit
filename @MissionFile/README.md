# Extending AdminToolkit features

The AdminToolkit takes advantage of the MissionFile allowing you the add additional features (extensions) or commands.
To achieve this, the configuration class `CfgAdminToolkitCustomMod` is required in your  `description.ext` or `config.cpp` (depends on the setup)

Below you can find the skeleton of the `CfgAdminToolkitCustomMod` config class containing some quick button examples.

For a working extension setup, please refer to the <a href="README.ExileMod.md">ExileMod extension readme</a>

```
class CfgAdminToolkitCustomMod {
	/* Exclude some main menu items
	 * To only show the menus loaded from an extension, use:
	 * 
	 * ExcludeMenu[] = {"Players", "Vehicles", "Weapons" , "Other"};
	 */
	ExcludeMenu[] = {};
	
	/* Load an additional sqf file as MOD */
	Extensions[] = {
		/**
		 * Usage: "<Your Mod Title>", "<YourModFileWithoutExt>.sqf"
		 */
		/* Example for "ExileMod" using the "atk\extensions\ExileMod.sqf" */
	};

	/* 4 Quick buttons allowing to add any action you want - See example below*/
	QuickButtons[] = {
		/* send a chat message to selected player containing 'Test 123' */
		{"Chat", "['message', [AdminToolkit_Player, 'Test 123']] call AdminToolkit_doAction"},
		/* send a message to everyone using the parameter text field */
		{"Msg To All", "['messageall', AdminToolkit_Params] call AdminToolkit_doAction"},
		/* Quickly get a Helicopter */
		{"Heli", "['getvehicle', 'B_Heli_Light_01_armed_F'] call AdminToolkit_doAction"},
		/*4 button*/
		{"Empty", "['Command', 'Variable'] call AdminToolkit_doAction"}
	};
};
```

**ExcludeMenu[]**

This property is used to hide the default menu entries.
Useful when you only want to display your extension.


**Extensions[]**

This property is used to load additional extensions (*.sqf files) located in the MissionFile `atk\extensions` folder.
On server side it will also include the same file from its `extensions` folder to execute global commands.

**QuickButtons[]**

Allows you to overwrite the four quick buttons with some custom commands