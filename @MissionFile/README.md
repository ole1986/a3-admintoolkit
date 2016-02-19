# Extending AdminToolkit features

Using the MissionFile you can extend and (partly) overwrite features of the AdminToolkit.<br />
To achieve this a configuration class `CfgAdminToolkitCustomMod` is required in your `description.ext`
 
```
class CfgAdminToolkitCustomMod {
	// Used to replace the top menu button text (optional)
	//AdminToolkit_MenuTitle[] = {"Players", "Vehicles", "Weapons", "AI", "Buildings", "Items"};
	
	// Used for server-side execution (optional)
	//AdminToolkit_ModEnable = "";
	
	//AdminToolkit_Mod_Players = "";
	AdminToolkit_Mod_Vehicles = "atk\AdminToolkit_Vehicles_Demo.sqf";
	//AdminToolkit_Mod_Weapons = "";
	//AdminToolkit_Mod_Custom = "";
	//AdminToolkit_Mod_Other = "";
	//AdminToolkit_Mod_Items = "";
};
```

This causes the script <a href="%40MissionFile/atk/AdminToolkit_Vehicles_Demo.sqf">AdminToolkit_Vehicles_Demo.sqf</a> to be executed when user opens the `Vehicles` section.

## Authorized server requests (bypass battleye)

Scripts defined above are usually executed from its client.<br />
To make it more secure and also make sure only authorized players (Admin/Moderator) are allowed to execute, it is recommended to build an **additional server extension script**.

To achieve this it is neccessary to define the `AdminToolkit_ModEnable` property located in the `CfgAdminToolkitCustomMod` class

**Example**

`AdminToolkit_ModEnable = "myExtension";`

```
// File: @ExileServer\admintoolkit\code\AdminToolkit_server_myExtension.sqf
private['_playerObject','_request', '_params'];
_playerObject = _this select 0;
_request = _this select 1;
_params = _this select 2;

try 
{
    switch (_request) do {
		case 'myExtension_action1': 
		{
            // output player name in server log
			diag_log format["Player: %1", name _playerObject];
		};
		case 'myExtension_action2': 
		{
			// yet another action
		};
    };
}
catch
{
    diag_log format["[ADMINTOOLKIT-MOD]: EXCEPTION: %1", _exception];
};

true;
```

To pass the call it uses the arma feature known as "Remote Execution".

**Example Client**
```
// supposed to print out the player name in server log
[player, "myExtension_action1", []] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
```

