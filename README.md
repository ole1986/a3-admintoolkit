## AdminToolkit for Arma 3 v0.7

This tool is used to administrate Arma3 multiplayer server.

**<p align="center">PRESS THE F2 KEY IN-GAME TO OPEN</p>**

<img src="images/a3-atk-players.jpg" width="250" title="Manage players">
<img src="images/a3-atk-vehicles.jpg" width="250" title="Spawn vehicles">
<img src="images/a3-atk-weapons.jpg" width="250" title="Spawn vehicles">
<img src="images/a3-atk-items.jpg" width="250" title="Get weapons">

**Core Features:**

- Teleport from/to players and to map position (by using the in-game map - hold ALT key and press LMB)
- Spectate player
- God Mode
- Kick/Ban players
- Vehicle spawning (for player)
- spawn Weapon/Magazine

*Please note: This does not replace an AntiCheat software (like battleye)*

## Installation
### Required Tools

+ PBO Manager - to setup UIDs and server password in server pbo
+ Notepad++ or any other Text Editor (https://notepad-plus-plus.org/)

### Client

+ Copy the directory `@AdminToolkit` folder into your Arma3 game directory 
+ Load the mod through Arma 3 Launcher when you start the game

### Server

+ Copy the `admintoolkit.pbo` from the @ExileServer folder into your `<ExileServerMod>\addons` directory.
+ Setup the `config.cpp` accordingly - see <a href="#configuration">Configuration</a>
+ Copy the `admintoolkit.bikey` server key file into your server `keys` directory
 
### Addons

EXILE: <a href="@MissionFile/README.exile.md">AdminToolkit with ExileMod features</a>

## Configuration

Before you can use the AdminToolkit it is necessary to add you as administrator.
Please find the server `config.cpp` in your `@ExileServer\admintoolkit` directory and amend it according to your requirements

```
/**
 * Server command password required to execute kick, ban, etc...
 */
ServerCommandPassword = "";
/**
 * list of allowed admins using its player UID
 */
AdminList[] = {"76561198088277918"};
/**
 * list of admins with restricted access only
 */
ModeratorList[] = {"76561198037325738"};
/**
 * allowed commands for moderators (default: teleport to a player, get a vehicle, get player list, spectate)
 */
ModeratorCmds[] = {"tp2player", "getvehicle", "kickplayer", "playersCallback", "specplayer", "specstop"};
```

Moderators have limited access - The command list can optionally be customized

### Battleye

**remoteexec.txt**

+ add `!"AdminToolkit_network_receiveRequest"` to the end of the line

**scripts.txt**

+ add `!="displayAddEventHandler [\"KeyDown\",\"call AdminToolkit_bindEvents;\"]"` at the end of `7 eventHandler [...]`
+ add `!="remoteExecCall ['AdminToolkit_network_receiveRequest',"` at the end of `7 remoteexec`
+ add `7 onMapSingleClick !="call admintoolkit_butt"` as a new line if `7 onMapSingleClick` does not exists or add it to the end of the line
+ add `!="objectFromNetId _params;\nadmintoolkit_specCam = \"camera\" camCreate"` at the end of line `7 camCreate`
