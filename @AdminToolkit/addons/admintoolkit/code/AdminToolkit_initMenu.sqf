/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
private['_display', '_extensions'];
disableSerialization;
_display = findDisplay 40000;

// show the title of its tool
(_display displayCtrl RscAdminToolkitTitle_IDC) ctrlSetStructuredText parseText "<t color='#c72651'>AdminToolkit Main Menu</t>";

// load the default menu into main menu combo box
{
	lbAdd [RscAdminToolkitMainMenu_IDC, _x];
} forEach AdminToolkit_MainMenu;

// load additional extension entries into the main menu (if available)
if(isClass(missionConfigFile >> 'CfgAdminToolkitCustomMod')) then {
	// CfgAdminToolkitCustomMod is supposed to be an array of strings
	if(isArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'Extensions')) then {
		_extensions = getArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'Extensions');
		{
			lbAdd [RscAdminToolkitMainMenu_IDC, _x];
		} forEach _extensions;
	};
};

// add the event handler for the main menu
(_display displayCtrl RscAdminToolkitMainMenu_IDC) ctrlSetEventHandler ["LBSelChanged","call AdminToolkit_menuEvents"];

(_display displayCtrl RscAdminToolkitInfo_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Choose an item from the Main Menu</t>";