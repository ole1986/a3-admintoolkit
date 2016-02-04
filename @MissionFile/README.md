# Mission File

This folder is used to extend the AdminToolkit using additional files from the MissionFile.
All supported extensions are usually stored with `AdminToolkit_<MenuEntry>_<ModName>.sqf` in the `admintoolkit` folder.

### Possible Menues

The following menues can be overwritten through your MissionFile `config.cpp` 

| Menu     |
| -------- |
| Players  |
| Vehicles |
| Weapons  |
| Mod1     |
| Mod2     |
| Mod3     |

### Example

Below is an example on how to enable ExileMod features by amending the config.cpp (located in mission.pbo)

```
// add this class to extend the AdminToolkit with your mod features
// Example: ExileMod (persistent vehicles)

class CfgAdminToolkitCustomMod {
    AdminToolkit_Mod_Players = "";
    AdminToolkit_Mod_Vehicles = "admintoolkit\AdminToolkit_Vehicles_Exile.sqf";
    AdminToolkit_Mod_Items = "";
};
```