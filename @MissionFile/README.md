# Extending AdminToolkit features

Using the MissionFile you can extend and (partly) overwrite features of the AdminToolkit.<br />
To achieve this a configuration class `CfgAdminToolkitCustomMod` is required in your `description.ext`
 
```
class CfgAdminToolkitCustomMod {
	Extensions[] = {
		/* Title, SQF file (located in atk folder) */
		{"Exile Mod","ExileMod"}
	};
};
```