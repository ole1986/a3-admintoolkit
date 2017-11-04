/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
disableSerialization;
private _display = findDisplay 40000;
private _extensions = getArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'ExcludeMenu');

// show the title of its tool
(_display displayCtrl RscAdminToolkitTitle_IDC) ctrlSetStructuredText parseText "<t color='#c72651'>AdminToolkit Main Menu</t>";

// load the default menu into main menu combo box
{
	if (_extensions find _x == -1) then {
		[_x] call AdminToolkit_addMenu;
	};
} forEach AdminToolkit_MainMenu;

// load additional extension entries into the main menu (if available)
if(isClass(missionConfigFile >> 'CfgAdminToolkitCustomMod')) then {
	// CfgAdminToolkitCustomMod is supposed to be an array of strings
	if(isArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'Extensions')) then {
		_extensions = getArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'Extensions');
		{
			_x call AdminToolkit_addMenu;
		} forEach _extensions;
	};

	// quick access buttons QUICK 1 - 4 ( RscAdminToolkitQuickX_IDC )
	if(isArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'QuickButtons')) then {
		private _i = 1;
		_extensions = getArray(missionConfigFile >> 'CfgAdminToolkitCustomMod' >> 'QuickButtons');
		{
			private _IDC = missionNamespace getVariable format["RscAdminToolkitQuick%1_IDC", _i];
			ctrlSetText [_IDC, _x select 0];
			buttonSetAction [_IDC, _x select 1];	
			_i = _i + 1;
		} forEach _extensions;
	};
};

if(!isNil "AdminToolkit_MenuIndex") then {
	lbSetCurSel [RscAdminToolkitMainMenu_IDC, AdminToolkit_MenuIndex];
	call AdminToolkit_loadActions;
};

// hide the second list initially
false call AdminToolkit_toggleDetail;

// clear default descriptions
(_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "";
(_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "";

if(!(isDamageAllowed player)) then {
	(_display displayCtrl RscAdminToolkitActionLabel_IDC) ctrlSetStructuredText parseText "<t color='#c72651'>Godmode is enabled</t>";
} else {
	(_display displayCtrl RscAdminToolkitActionLabel_IDC) ctrlSetStructuredText parseText "Pick an entry from Main Menu to display the actions";	
};

// Requesting players list
[] spawn {
	systemChat "Loading players...";
	[player, 'getplayers'] remoteExecCall ['AdminToolkit_network_receiveRequest', 2];
};

// hide the parameters edit field by default
(_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow false;

// add the event handler for the main menu
(_display displayCtrl RscAdminToolkitMainMenu_IDC) ctrlSetEventHandler ["LBSelChanged","call AdminToolkit_loadActions"];
// add the event handler for the actions menu
(_display displayCtrl RscAdminToolkitActionList_IDC) ctrlSetEventHandler ["LBSelChanged","call AdminToolkit_onActionChanged"];
(_display displayCtrl RscAdminToolkitEditAction_IDC) ctrlSetEventHandler ["KeyDown", "if ((_this select 1) == 0x1C or (_this select 1) == 0x9C) then { call AdminToolkit_loadActions };"];

// setup the event onLbSelChanged for the centered listbox
(_display displayCtrl RscAdminToolkitDetailList_IDC) ctrlSetEventHandler ['LBSelChanged', "call AdminToolkit_onDetailChanged"];
(_display displayCtrl RscAdminToolkitEditDetail_IDC) ctrlSetEventHandler ["KeyDown", "if ((_this select 1) == 0x1C or (_this select 1) == 0x9C) then { call AdminToolkit_loadDetails };"];

(_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "";

// define the AdminToolkit_OnExecute event used by the Run button - overwritable by extensions
buttonSetAction [RscAdminToolkitRun_IDC, 'call AdminToolkit_OnExecute'];