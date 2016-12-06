# AdminToolkit replace Buildings with only furniture stuff
<sup>Version: 0.1 | Author: Stoll | Last update: 2016-08-08 | Compatibility update from ATK v1.8 to 2.0 by ole1986</sup>

Please make sure the following files exists is this package 

+ `@MissionFile\atk\extension\Furniture.sqf`

## Installation

Please make sure you have followed the exact instruction of the AdminToolkit <a href="../README.md">README.md</a>

**MissionFile**

+ Unpack your mission file
+ Copy the above mentioned file(s) into your `MissionFile\atk\extension` folder
+ Customize the `descritption.ext` located in your mission file as follow:

```
// add this class into the descritption.ext of your mission file
/* Load an additional sqf file as MOD */
Extensions[] = {
		/**
		 * Usage: "<Your Mod Title>", "<YourModFileWithoutExt>.sqf"
		 */
		{"Stoll Furniture","Furniture"}
	};
```

+ Pack your mission file and upload it to your server
