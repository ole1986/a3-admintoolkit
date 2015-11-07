/**
 * AdminHelper - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
// make functions available
missionNamespace setVariable ['adminhelper_fetchPlayers', compileFinal preprocessFile "adminhelper\adminhelper_fetchPlayers.sqf"];
missionNamespace setVariable ['adminhelper_fetchVehicles', compileFinal preprocessFile "adminhelper\adminhelper_fetchVehicles.sqf"];
missionNamespace setVariable ['adminhelper_buttonEvents', compileFinal preprocessFile "adminhelper\adminhelper_buttonEvents.sqf"];
missionNamespace setVariable ['adminhelper_buttonAction', compileFinal preprocessFile "adminhelper\adminhelper_buttonAction.sqf"];
missionNamespace setVariable ['adminhelper_bindEvents', compileFinal preprocessFile "adminhelper\adminhelper_bindEvents.sqf"];

missionNamespace setVariable ['adminhelper_selectedPlayer', ''];

waitUntil {!isNull (findDisplay 46)};

// event handler for map click event using Alt + click to teleport the player
player onMapSingleClick "if (_alt) then { ['tp2pos', _pos] call adminhelper_buttonAction; }";

// call bindEvents once mail dialog is finished,, at this time F2 key should work
(findDisplay 46) displaySetEventHandler ["KeyDown","call adminhelper_bindEvents;"];