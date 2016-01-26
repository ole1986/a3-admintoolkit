/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 * @version 0.2
 */
 
// make functions available
missionNamespace setVariable ['admintoolkit_openEvent', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_openEvent.sqf"];
missionNamespace setVariable ['admintoolkit_weaponMagazine', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_weaponMagazine.sqf"];

missionNamespace setVariable ['admintoolkit_buttonEvents', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_buttonEvents.sqf"];
missionNamespace setVariable ['admintoolkit_buttonAction', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_buttonAction.sqf"];
missionNamespace setVariable ['admintoolkit_bindEvents', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_bindEvents.sqf"];

missionNamespace setVariable ['admintoolkit_selectedPlayer', ''];

waitUntil {!isNull (findDisplay 46)};

"admintoolkit_callback" addPublicVariableEventHandler {
	private['_action', '_params'];
	_action = (_this select 1) select 0;
	_params = (_this select 1) select 1;
	
	systemChat "Received admintoolkit_callback from server";
	
	switch(_action) do {
		case 'specplayer': {
			admintoolkit_specCam = "camera" camCreate (position player);
            admintoolkit_specCam camSetTarget player;
            admintoolkit_specCam camSetRelPos [0, -1.5, 1.7];
            admintoolkit_specCam cameraEffect ["internal", "back"];
            admintoolkit_specCam camCommit 0;
			systemChat format["Spectating %1", name player];
		};
		case 'godmode': {
			if(_params) then { player allowDamage false; } else { player allowDamage true; };
			systemChat format["Godmode %1", str _params];
		};
	};
};

// event handler for map click event using Alt + click to teleport the player
player onMapSingleClick "if (_alt) then { ['tp2pos', _pos] call admintoolkit_buttonAction; true; } else { false; };";

// call bindEvents once mail dialog is finished,, at this time F2 key should work
(findDisplay 46) displayAddEventHandler ["KeyDown","call admintoolkit_bindEvents;"];