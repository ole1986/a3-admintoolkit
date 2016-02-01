## AdminToolkit for Arma 3 v0.6 - Exile Edition -

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
- spawn Weapon/Magazine

*Please note: This does not replace an AntiCheat software neither be used as cheating tool*

## Installation
### Required Tools

+ (optional) PBO Manager - required to setup server password
+ Notepad++ or any other Text Editor (https://notepad-plus-plus.org/)

### Client installation

+ Copy the directory `@AdminToolkit` folder into your Arma3 game directory 
+ Load the mod through Arma 3 Launcher when you start the game

### Server installation

+ Copy the `admintoolkit.pbo` from the @ExileServer folder into your `<ExileServerMod>\addons` directory.
+ Copy the `admintoolkit.bikey` server key file into your server `keys` directory

## Configuration

The important configuration settings are located in `@ExileServer\admintoolkit\config.cpp`.
If you want to use the feature of  kick/ban players you need to customize the `ServerCommandPassword` properly (check your server.cfg)

```
/**
 * Server command password required to execute kick, ban, etc...
 */
ServerCommandPassword = "";
```

To setup the administrators and moderators these lines are important

```
/**
 * list of allowed admins using its player UID
 */
AdminList[] = {"76561198088277918"};
/**
 * list of admins with restricted access only
 */
ModeratorList[] = {"76561198037325738"};
```

Additionally you can set the permissions a moderator has by using the below property

```
/**
 * allowed commands for moderators (default: teleport to a player, get a vehicle, get player list, spectate a player)
 */
ModeratorCmds[] = {"tp2player", "getvehicle", "kickplayer", "playersCallback", "specplayer", "specstop"};
```
 
### Battleye

**remoteexec.txt**

+ add `!"AdminToolkit_network_receiveRequest"` to the end of the line

**scripts.txt**

+ add `!="displayAddEventHandler [\"KeyDown\",\"call AdminToolkit_bindEvents;\"]"` at the end of `7 eventHandler [...]`
+ add `7 onMapSingleClick !="call admintoolkit_butt"` as a new line if `7 onMapSingleClick` does not exists or add it to the end of the line
+ add `!="objectFromNetId _params;\nadmintoolkit_specCam = \"camera\" camCreate"` at the end of line `7 camCreate`
