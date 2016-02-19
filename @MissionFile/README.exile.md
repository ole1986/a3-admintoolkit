# AdminToolkit with ExileMod extension

Please make sure the following files exists is this package 

+ `@MissionFile\atk\AdminToolkit_Vehicles_Exile.sqf`

## Installation

Please make sure you have followed the exact instruction of the AdminToolkit <a href="../README.md">README.md</a>
It is also necessary to add you player UID in the `config.cpp` located in `@ExileServer\admintoolkit` directory

**MissionFile**

+ Unpack your mission file
+ Copy the folder `@MissionFile\atk` into your mission file root directory
+ Customize the `descritption.ext` or `config.cpp` located in your mission file as follow:

```
// add this class into config.cpp of your mission file
class CfgAdminToolkitCustomMod {
    AdminToolkit_ModEnable = "exile";
    AdminToolkit_Mod_Vehicles = "atk\AdminToolkit_Vehicles_Exile.sqf";
};
```

+ Pack your mission file and upload it to your server

**ServerFile**

This extension is part of the AdminToolkit which includes `AdminToolkit_server_exile.sqf` - No more action required
