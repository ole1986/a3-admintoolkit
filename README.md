## AdminToolkit for Arma 3 v0.4 - Exile Edition -

This tool is used to administrate Arma3 multiplayer server more easily.

<img src="images/a3-atk-players.jpg" width="250" title="Manage players">
<img src="images/a3-atk-vehicles.jpg" width="250" title="Spawn vehicles">
<img src="images/a3-atk-weapons.jpg" width="250" title="Get weapons">

**Core Features:**

- Teleport from/to players and to map position (by using the in-game map - hold ALT key and press LMB)
- Spectate player
- God Mode
- Kick/Ban players
- Vehicle spawning (for player)
- Weapon/Item spawing

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
+ **add the line `[] execVM "admintoolkit\init.sqf"` in your `initPlayerLocal.sqf`**
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
		class AdminToolkit_network_receiveResponse { allowedTargets=1; }; // <- ADD THIS LINE
    };
};
```

### Server modifictions

+ Copy the `admintoolkit.pbo` from the @ExileServer folder into your `<ExileServerMod>\addons` directory.
 
### Battleye

**remoteexec.txt**

+ add `!"AdminToolkit_network_receiveRequest"` to the end of the line

**scripts.txt**

+ add `!="displayAddEventHandler [\"KeyDown\",\"call admintoolkit_bindEvents;\"]"` at the end of `7 eventHandler [...]`
+ add `7 onMapSingleClick !="call admintoolkit_butt"` as a new line if `7 onMapSingleClick` does not exists or add it to the end of the line
+ add `!="objectFromNetId _params;\nadmintoolkit_specCam = \"camera\" camCreate"` at the end of line `7 camCreate`
