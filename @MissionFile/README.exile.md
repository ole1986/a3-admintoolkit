# Extending AdminToolkit with ExileMod features

Please be sure you have followed the exact instruction of the AdminToolkit <a href="../README.md">README.md</a>
It is also necessary to add you player UID in the `config.cpp` located in `@ExileServer\admintoolkit` directory

### Installation

+ Unpack your mission file
+ Copy the folder `@MissionFile\atk` into your mission file root directory
+ Customize the config.cpp located in your mission file as follow:

```
// add this class into config.cpp of your mission file
class CfgAdminToolkitCustomMod {
    AdminToolkit_ModEnable = "exile";
    AdminToolkit_Mod_Vehicles = "atk\AdminToolkit_Vehicles_Exile.sqf";
};
```

+ Pack your mission file and upload it to your server

### Verify

Once your have done all the steps you can verify it by opening the AdminToolkit (using the default keyboard key F2).
Click on `Vehicles` and you should see a new button named "Exile Spawn".

