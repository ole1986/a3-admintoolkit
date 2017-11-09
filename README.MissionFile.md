# Extending AdminToolkit features

**PLEASE NOTE: This README is ONLY important for Extension configuration or development**

**PLEASE NOTE: Make sure you have read the README.&lt;ExtensionName&gt;.sqf for extensions installation instruction**

The AdminToolkit takes advantage of the MissionFile concept allowing you to add additional features.

- Extending the Menu Menu
- adding additional action command (client/server side)
- customize QuickButton actions
- (...)

<p align="center">
	<a href="#build-your-own-extension">Build your own Extension (Guide)</a>
</p>

To achieve this, the configuration class `CfgAdminToolkitCustomMod` is required in your `config.cpp` located in your MissionFile.
Below is an excerpt of the current `CfgAdminToolkitCustomMod`.

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
		* Usage: {"<Your Mod Title>", "<YourModFile>"}
		* add a new menu entry called My Extension into main menu */
		{"My Extension", "MyExtension"}
	};

	/* 4 Quick buttons allowing to add any action you want - See example below*/
	QuickButtons[] = {
		/* send a message to everyone using the parameter text field */
		{"Restart Msg", "['messageall', ['Server Restart in X minutes']] call AdminToolkit_doAction"},
		/* Quickly get a Helicopter */
		{"Heli", "['getvehicle', ['B_Heli_Light_01_armed_F']] call AdminToolkit_doAction"},
		/*4 button*/
		{"Empty", "['Command', ['Variable #1', 'Variable #2']] call AdminToolkit_doAction"}
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

## Build your own extension

This is a Step-by-step guide on how to build your own extension.
In this guide you will learn how to add a new Menu entry, add new action commands, pass them to the server and finally execute custom code (from server)

- First, make sure you have copied the above mentioned `CfgAdminToolkitCustomMod` into the config.cpp.
- Now, add the following line into the Extensions[] property: `{"My Extension", "MyExtension"}`

```
Extensions[] = {
	/* add a new menu entry called My Extension into main menu */
	{"My Extension", "MyExtension"}
};
```

- Once the menu is selected, it searches for the sqf file "MyExtension.sqf" in `atk\extension\MyExtension.sqf`. So, lets create this now:

As you can see, we have added to actions- The first (myext_hellotomyself) is a local call to showMessage only.
The second (and more interesting) action is passed to the server.

- Now we need to setup the server to accept the action "myext_helloserver".

```
// extension\MyExtension.sqf (located in admintoolkit_servercfg.pbo)

private['_playerObject','_request', '_params'];
_playerObject = _this select 0;
_request = _this select 1; // is supposed to be the action command (myext_helloserver)
_params = _this select 2; // is the text: "some secret text to the server"


// to keep it simple output every action and parameter into servers log file (so check the log once you execute your custom action)

diag_log format["[ADMINTOOLKIT-MYEXTENSION]: The action is %1 and the parameter is %2", _request, str _params];
```

