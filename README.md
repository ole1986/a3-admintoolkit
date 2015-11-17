## AdminToolkit for Arma 3 v0.2 - Exile Edition -

This tool is used to administrate Arma3 multiplayer server more easily.

<img src="images/a3-atk-vehicles.jpg" width="250" title="Spawn vehicles">
<img src="images/a3-atk-weapons.jpg" width="250" title="Get weapons">

**Core Features:**

- Teleport from/to players and to map position (Alt + LMB)
- Vehicle spawning (for player)
- Weapon/Item spawing
- Easy to install (max 5 steps)

*Please note: This does not replace an AntiCheat software neither be used as cheating tool*

## Installation
### Required Tools

+ PBO Manager (I use cpbo from http://www.kegetys.fi/category/gaming/armamods/)
+ Notepad++ or any other Text Editor (https://notepad-plus-plus.org/)

### Prerequisite

Before you can start it is necessary to **unpack** the &lt;MissionFile&gt; using your favorite pbo manager

Placeholder            | File
---------------------- | -------------
&lt;MissionFile&gt;    | Exile.&lt;Mapname&gt;.pbo (E.g. Exile.Altis.pbo )
&lt;ExileServerMod&gt; | @ExileServer Exile server mod folder located in game directory.

### Mission modifications

+ Copy the folder `MissionFile\admintoolkit` into your `<MissionFile>` directory
+ Modify the `<MissionFile>\description.ext` and add the following lines
 
```
#include "admintoolkit\defines.hpp"
#include "admintoolkit\AdminToolkitMenu.hpp"
```
---
```
class CfgRemoteExec
{
    class Functions
    {
        class AdminToolkit_network_receiveRequest { allowedTargets=2; }; // <- ADD THIS LINE
    };
};
```

### Server modifictions

+ Copy the `admintoolkit.pbo` from the @ExileServer folder into your `<ExileServerMod>\addons` directory.
 
### Battleye

**remoteexec.txt**

+ add this `!"AdminToolkit_network_receiveRequest"` to the end of the line

**scripts.txt**

+ add `!="displayAddEventHandler [\"KeyDown\",\"call admintoolkit_bindEvents;\"]"` at the end of `7 eventHandler [...]`
+ add `7 onMapSingleClick !="call admintoolkit_butt"` as a new line if `7 onMapSingleClick` did not exists or add it to the end of the line
