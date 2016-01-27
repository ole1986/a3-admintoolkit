/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
// make functions available
missionNamespace setVariable ['AdminToolkit_network_receiveResponse', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_network_receiveResponse.sqf"];
missionNamespace setVariable ['AdminToolkit_bindEvents', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_bindEvents.sqf"];
//missionNamespace setVariable ['AdminToolkit_fetchPlayer', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_fetchPlayer.sqf"];
missionNamespace setVariable ['AdminToolkit_buttonEvents', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_buttonEvents.sqf"];
missionNamespace setVariable ['AdminToolkit_buttonAction', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_buttonAction.sqf"];
missionNamespace setVariable ['AdminToolkit_weaponMagazine', compileFinal preprocessFileLineNumbers "admintoolkit\code\AdminToolkit_weaponMagazine.sqf"];

missionNamespace setVariable ['AdminToolkit_selectedPlayer', ''];

waitUntil {!isNull (findDisplay 46)};

// event handler for map click event using Alt + click to teleport the player
player onMapSingleClick "if (_alt) then { ['tp2pos', _pos] call AdminToolkit_buttonAction; true; } else { false; };";

// call bindEvents once mail dialog is finished,, at this time F2 key should work
(findDisplay 46) displayAddEventHandler ["KeyDown","call AdminToolkit_bindEvents;"];