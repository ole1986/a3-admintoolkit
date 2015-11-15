/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 * @version 0.1
 */
 
// make functions available
missionNamespace setVariable ['admintoolkit_fetchPlayers', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_fetchPlayers.sqf"];
missionNamespace setVariable ['admintoolkit_fetchVehicles', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_fetchVehicles.sqf"];
missionNamespace setVariable ['admintoolkit_fetchWeapons', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_fetchWeapons.sqf"];
missionNamespace setVariable ['admintoolkit_weaponMagazine', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_weaponMagazine.sqf"];

missionNamespace setVariable ['admintoolkit_buttonEvents', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_buttonEvents.sqf"];
missionNamespace setVariable ['admintoolkit_buttonAction', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_buttonAction.sqf"];
missionNamespace setVariable ['admintoolkit_bindEvents', compileFinal preprocessFileLineNumbers "admintoolkit\admintoolkit_bindEvents.sqf"];

missionNamespace setVariable ['admintoolkit_selectedPlayer', ''];

waitUntil {!isNull (findDisplay 46)};

// event handler for map click event using Alt + click to teleport the player
//['adminhelper_mapAction', 'onMapSingleClick', {if (_alt) then { [_this, _pos] call adminhelper_buttonAction; }; true} , 'tp2pos'] call BIS_fnc_addStackedEventHandler;
player onMapSingleClick "if (_alt) then { ['tp2pos', _pos] call adminhelper_buttonAction; true; } else { false; };";

// call bindEvents once mail dialog is finished,, at this time F2 key should work
(findDisplay 46) displayAddEventHandler ["KeyDown","call admintoolkit_bindEvents;"];