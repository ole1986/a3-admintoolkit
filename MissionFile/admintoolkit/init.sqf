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

// event handler for map click event using Alt + click to teleport the player
player onMapSingleClick "if (_alt) then { ['tp2pos', _pos] call admintoolkit_buttonAction; true; } else { false; };";

// call bindEvents once mail dialog is finished,, at this time F2 key should work
(findDisplay 46) displayAddEventHandler ["KeyDown","call admintoolkit_bindEvents;"];