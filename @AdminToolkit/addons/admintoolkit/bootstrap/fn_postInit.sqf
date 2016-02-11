/**
 * AdminToolkit - postInit
 */

missionNamespace setVariable ['AdminToolkit_selectedPlayer', ''];
missionNamespace setVariable ['AdminToolkit_selectedMenu', 0];
missionNamespace setVariable ['AdminToolkitIsBuilding', 0];

[] spawn {
	waitUntil {!isNull (findDisplay 46)};
	
	// it seems there need to be a delay to really make sure display 46 is availble?!
	sleep 3;

	// event handler for map click event using Alt + click to teleport the player
	player onMapSingleClick "if (_alt) then { ['tp2pos', _pos] call AdminToolkit_buttonAction; true; } else { false; };";

	// call bindEvents once mail dialog is finished,, at this time F2 key should work
	(findDisplay 46) displayAddEventHandler ["KeyDown","call AdminToolkit_bindEvents;"];
	systemChat "AdminToolkit READY - Press F2 to open";
};

diag_log "AdminToolkit postInit";
 
true;