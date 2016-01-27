/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
// make functions available
missionNamespace setVariable ['AdminToolkit_bindEvents', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_bindEvents.sqf"];
//missionNamespace setVariable ['AdminToolkit_fetchPlayer', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_fetchPlayer.sqf"];
missionNamespace setVariable ['AdminToolkit_buttonEvents', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_buttonEvents.sqf"];
missionNamespace setVariable ['AdminToolkit_buttonAction', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_buttonAction.sqf"];
missionNamespace setVariable ['AdminToolkit_weaponMagazine', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_weaponMagazine.sqf"];

missionNamespace setVariable ['AdminToolkit_selectedPlayer', ''];

waitUntil {!isNull (findDisplay 46)};

"admintoolkit_callback" addPublicVariableEventHandler {
	private['_action', '_params'];
	_action = (_this select 1) select 0;
	_params = (_this select 1) select 1;
	
	switch(_action) do {
		case 'playersCallback': {
			lbClear 1500;
			
			{
				lbAdd [1500, _x];
			} forEach _params;
		};
		case 'specplayer': {
			// get the real player object from its netId
			_params = objectFromNetId _params;
			admintoolkit_specCam = "camera" camCreate (position _params);
			admintoolkit_specCam camSetRelPos [0, -1.5, 1.7];
			admintoolkit_specCam cameraEffect ["internal", "back"];
			admintoolkit_specCam attachTo [_params, [0,-1,1.8]];
			
			systemChat format["Spectating %1", name _params];
			//admintoolkit_specCam = "camera" createvehicle [0,0,0];
			//admintoolkit_specCam camsettarget player;
			//admintoolkit_specCam SwitchCamera "internal";
			//admintoolkit_specCam attachTo [player, [0,-1,1.8]];
		};
		case 'godmode': {
			if(_params) then { player allowDamage false; } else { player allowDamage true; };
			systemChat format["Godmode %1", str _params];
		};
	};
};

// event handler for map click event using Alt + click to teleport the player
player onMapSingleClick "if (_alt) then { ['tp2pos', _pos] call AdminToolkit_buttonAction; true; } else { false; };";

// call bindEvents once mail dialog is finished,, at this time F2 key should work
(findDisplay 46) displayAddEventHandler ["KeyDown","call AdminToolkit_bindEvents;"];