# AdminToolkit replace Buildings with only furniture stuff

Please make sure the following files exists is this package 

+ `@MissionFile\atk\AdminToolkit_Custom_Furniture.sqf`

## Installation

Please make sure you have followed the exact instruction of the AdminToolkit <a href="../README.md">README.md</a>

**MissionFile**

+ Unpack your mission file
+ Copy the above mentioned file(s) into your `MissionFile\atk` folder
+ Customize the `descritption.ext` or `config.cpp` located in your mission file as follow:

```
// add this class into config.cpp of your mission file
class CfgAdminToolkitCustomMod {
    // [...]
	AdminToolkit_Mod_Custom = "atk\AdminToolkit_Custom_Furniture.sqf";
	// [...]
};
```

+ Pack your mission file and upload it to your server
