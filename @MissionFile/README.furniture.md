# AdminToolkit replace Buildings with only furniture stuff

Please make sure the following files exists is this package 

+ `@MissionFile\atk\AdminToolkit_Custom_Furniture.sqf`

## Installation

Please make sure you have followed the exact instruction of the AdminToolkit <a href="../README.md">README.md</a>

**MissionFile**

+ Unpack your mission file
+ Copy the above mentioned file(s) into your `MissionFile\atk` folder
+ Customize the `descritption.ext` located in your mission file as follow:

```

// add this class into the descritption.ext of your mission file
/* Load an additional sqf file as MOD */
Extensions[] = {
		/**
		 * Usage: "<Your Mod Title>", "<YourModFileWithoutExt>.sqf"
		 */
		/* Example for "Stoll Furniture" using the "Custom_Stoll_Furniture.sqf" */
		{"Stoll Furniture","Custom_Stoll_Furniture"}
	};
```

+ Pack your mission file and upload it to your server
