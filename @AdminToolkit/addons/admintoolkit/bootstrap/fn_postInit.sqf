/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_name'];

missionNamespace setVariable ['AdminToolkit_MainMenu', ['Players', 'Vehicles', 'Weapons', 'Buildings', 'Other', 'Items']];

missionNamespace setVariable ['AdminToolkit_selectedPlayer', ''];
missionNamespace setVariable ['AdminToolkit_selectedMenu', ''];
missionNamespace setVariable ['AdminToolkit_lastSelection', ''];
missionNamespace setVariable ['AdminToolkit_lastAction', ''];
missionNamespace setVariable ['AdminToolkit_camera', nil];
missionNamespace setVariable ['AdminToolkit_cameraKeyDownId', nil];
missionNamespace setVariable ['AdminToolkit_player', nil];
missionNamespace setVariable ['AdminToolkit_permissionSet', []];

{
	// make all IDC number easily accessible
	// example "RscAdminToolkitTitle_IDC" returns the IDC of the Title of the dialog (which is 1900)
	_name = format["%1_IDC", configName _x];
	missionNamespace setVariable [_name , getNumber(_x >> "IDC")];
} forEach ("true" configClasses (configFile >> "AdminToolkitMenu"));


[] spawn {
	waitUntil {!isNull (findDisplay 46)};
	// it seems there need to be a delay to really make sure display 46 is availble?!
	sleep 3;

	// event handler for map click event using Alt + click to teleport the player - more compatible with other addons
	["atkTeleport", "onMapSingleClick", { if (_alt) then { ['tp2pos', _pos] call AdminToolkit_doAction; true; } else { false; }; }] call BIS_fnc_addStackedEventHandler;

	// call bindEvents once mail dialog is finished,, at this time F2 key should work
	(findDisplay 46) displayAddEventHandler ["KeyDown","call AdminToolkit_bindKeyEvents;"];
	
	systemChat "Logging into AdminToolkit...";
	['login'] call AdminToolkit_doAction;
};

diag_log "AdminToolkit postInit";
true;