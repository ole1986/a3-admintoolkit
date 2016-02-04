# Extending AdminToolkit through MissionFile

This folder is used to extend the AdminToolkit using additional files from the MissionFile.
All supported extensions are usually stored with `AdminToolkit_<MenuEntry>_<ModName>.sqf` in the `admintoolkit` folder.

### Possible Menues

The following menues can be overwritten through your MissionFile `config.cpp` 

| Players  | Vehicles | Weapons  | Mod1     | Mod2     | Mod3     |
| -------  | -------- | -------  | ----     | ----     | ----     |
| 1600     | 1601     | 1602     | 1603     | 1604     | 1605     |

## Example

Below is an example on how to enable an Addon feature (ExileMod) in MissionFile config.cpp

```
// Example: ExileMod (persistent vehicles)
class CfgAdminToolkitCustomMod {
    AdminToolkit_Mod_Players = "";
    AdminToolkit_Mod_Vehicles = "admintoolkit\AdminToolkit_Vehicles_Exile.sqf";
    AdminToolkit_Mod_Items = "";
};
```

Open the script <a href="admintoolkit/AdminToolkit_Vehicles_Exile.sqf">AdminToolkit_Vehicles_Exile.sqf</a> for more details
