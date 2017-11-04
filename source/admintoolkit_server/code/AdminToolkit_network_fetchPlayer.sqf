/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

/**
 * Used to either fetch all or only one player from allPlayers array
 * 
 * Usage: ["playername"] call admintoolkit_fetchPlayer; // returns the player object matching "playername" or nil
 * Usage: ["playername", true] call admintoolkit_fetchPlayer; // returns the player name only matching "playername" or nil
 * Usage: [nil, true] call admintoolkit_fetchPlayer; // returns the player name only matching "playername" or nil
 * Usage: call admintoolkit_fetchPlayer; // returns the array of all player units or nil if no player is available
 */
private _nameOnly = false;
private _match = '';
private _result = [];

if(typeName _this == "ARRAY") then {
	_match = _this select 0;
	if(count _this > 1) then { _nameOnly = _this select 1; };
};

{
	if(_match == '' and _nameOnly) then {
		_result pushBack (netId _x);
	} else {
		if(name _x isEqualTo _match) exitWith {
			_result pushBack (netId _x);
		};
	};
	
} forEach allPlayers;

if(count _result <= 0) then {
	_result = nil;
} else {
	if((count _result == 1) && (_match != '')) then {
		_result = _result select 0;
	};
};

_result;