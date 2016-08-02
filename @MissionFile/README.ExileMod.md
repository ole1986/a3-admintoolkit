# AdminToolkit with ExileMod extension

Before you start, please make sure the following files exist in is this package 

+ `@MissionFile\atk\ExileMod.sqf`

## Installation

Please make sure you have followed the exact instruction of the AdminToolkit <a href="../README.md">README.md</a>
It is also necessary to add your player UID in the `config.cpp` located in `@ExileServer\admintoolkit` directory

**MissionFile**

+ Unpack your mission file
+ Copy the folder `@MissionFile\atk` into your MissionFile root directory
+ Customize the `descritption.ext`  located in your MissionFile as follow:

```
// add this class into the descritption.ext of your mission file
/* Load an additional sqf file as MOD */
Extensions[] = {
		/**
		 * Usage: "<Your Mod Title>", "<YourModFileWithoutExt>.sqf"
		 */
		/* Example for "ExileMod" using the "atk\ExileMod.sqf" */
		{"Exile Mod","ExileMod"}
	};
```

+ Pack your mission file and upload it to your server

**Server PBO**

This extension is part of the AdminToolkit Core containing the file `ExileMod.sqf` - No more action required
