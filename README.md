## AdminToolkit for Arma 3
[![Version](https://img.shields.io/badge/Version-2.1.2-green.svg)](https://github.com/ole1986/a3-admintoolkit/releases)
[![Author](https://img.shields.io/badge/Author-ole1986-green.svg)](https://github.com/ole1986)
[![Exile 1.0.3 Lemon](https://img.shields.io/badge/Exile-1.0.3%20Lemon-C72651.svg)](http://www.exilemod.com/devblog/103-update-lemon-r34/)
[![Arma 1.76](https://img.shields.io/badge/Arma-1.76-blue.svg)](https://dev.arma3.com/post/sitrep-00203)
[![License](https://img.shields.io/badge/License-APL-blue.svg)](https://www.bistudio.com/community/licenses/arma-public-license)

The ATK is used to administrate Arma 3 multiplayer servers and be extended with user extensions

<img src="images/a3-atk-players.jpg" align="left" width="200" title="Manage players">
<img src="images/a3-atk-buildings.jpg" align="left" width="200" title="Manage Buildings">
<img src="images/a3-atk-vehicles.jpg" align="" width="200" title="Spawn vehicles">
<img src="images/a3-atk-weapons.jpg" align="left" width="200" title="...and Weapons">
<img src="images/a3-atk-mod.jpg" align="left" width="200" title="...and Weapons">
<img src="images/a3-atk-mod-exilemoney.jpg" align="" width="200" title="...and Weapons">

**Videos**

<a href="https://www.youtube.com/watch?v=pMwK2d-1Fqg" target="_blank"><img src="http://img.youtube.com/vi/pMwK2d-1Fqg/0.jpg" width="410" /></a>
<a href="https://youtu.be/2yfdqvhU5A0" target="_blank"><img src="http://img.youtube.com/vi/2yfdqvhU5A0/0.jpg" width="410" /></a>

## Features

For a complete list of all features, please refer to <a href="FEATURES.md">FEATURES.md<a>

## Requirements

* Arma 3 Tools (installed through Steam - https://community.bistudio.com/wiki/Arma_3_Tools_Installation)

## Configuration

The AdminToolkit uses a server configuration file (config.cpp) to add administrators.<br />
So, open the file `source\admintoolkit_servercfg\config.cpp` and add your player uid into `AdminList[]`

Example:

```
AdminList[] = {"yourPlayerUID"};
```

Optionally you can add the ServerCommandPassword (stored in the config.cfg of your server) to manage kick and bans from the AdminToolkit

```
ServerCommandPassword = "yoursecretpassword";
```

As the AdminToolkit has a moderator mode, those player uids go to

```
ModeratorList[] = {"playerUID"};
```

Moderators can have restricted access - Please help yourself and read the config.cpp carefully to customize the permissions

## Build

PLEASE MAKE SURE BEFORE YOU BUILD, THAT YOU ARE LISTED AS ADMIN (SEE <a href="#configuration">CONFIGURATION</a>)

To build the required PBO files you can either use visual Studio Code or the powershell to run the build command

```
PS> .\setup.ps1 -Build
```

This will build the following files 

**Client**

* @AdminToolkit\addons\admintoolkit.pbo (Client Mod)
* @AdminToolkit\addons\admintoolkit.pbo.bisign (sign file)

**Server**

* @AdminToolkitServer\addons\admintoolkit_server.pbo (Server Mod)
* @AdminToolkitServer\addons\admintoolkit_servercfg.pbo (Server Mod Config)

**MissionFile**

This project is also shipped with a mission file patcher. Simple use the command below to patch you favorite mission.<br />
A dialog prompt will appear and let you choice your Mission.File.pbo

```
PS> .\setup.ps1 -PatchMission
```

This will generate the patche mission file into the folder

* @MissionFile\<Your.Mission.pbo>

## Install

PLEASE MAKE SURE YOU HAVE FOLLOWED THE <a href="#build">BUILD INSTRUCTIONS</a> BEFORE CONTINUE READING

**Client**

To install the AdminToolkit Client on your Game PC, please use the command<br />

```
PS> .\setup.ps1 -Install
```

After installation succeeded, please make sure you have enabled the mod when you run the game

**Server**

* Copy the @AdminToolkitServer folder into your servers root directory
* Copy the patched mission file located in @MissionFile into your servers `mpmissions` folder
* Copy the `admintoolkit.bikey` into your servers `keys` folder
* Enable the AdminToolkit mod on the server by running the arma3server with parameter `-servermod=@AdminToolkitServer`

<p align="center"><strong>RESTART THE SERVER, JOIN THE GAME AND PRESS F2 TO OPEN ATK</strong></p>

### Mission File (manual editing)

If for some reason the Mission Patcher (see Build -> MissionFile) does not work the below instruction explains the steps to customize the mission file manually

* Unpack your mission file using any PBO Unpacker (FileRev)
* Open the `description.ext` and add the below line into `class CfgRemoteExec -> class Functions`

```
class AdminToolkit_network_receiveRequest { allowedTargets = 2; };
```

For extension related implementations, please follow the <a href="#extensions">extension instructions below</a>

## Extensions

The AdminToolkit can be extended by using the MissionFile configuration class `CfgAdminToolkitCustomMod`.
For more details, please refer to the <a href="README.MissionFile.md">/README.MissionFile.md</a>

**Below is a list of available extensions**

| Name       | Description                                                                  | Autor(s)  | Links                                           
| ---------- | ---------------------------------------------------------------------------- | --------- | --- 
| ExileMod   | create persistent vehicles, receive ExileMoney and build objects, etc...     | ole       | <a href="source/mission_file/atk/README.ExileMod.md">README</a>
| Furniture  | support to build Furniture objects (Menu "Stoll Furniture")                  | Stoll     | <a href="source/mission_file/atk/README.Furniture.md">README</a>
| VanillaAI  | Experimental extension to support spawning AI units                          | ole       | <a href="source/mission_file/atk/README.VanillaAI.md">README</a>

## Battleye

Please use the below **Battleye Script Filters tool** to setup all Battleye exceptions:

http://a3ap.com/BEF.php
