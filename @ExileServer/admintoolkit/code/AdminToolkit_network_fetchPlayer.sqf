/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */

/**
 * Used to either fetch all or only one player from allPlayers array
 * 
 * Usage: ["playername"] call admintoolkit_fetchPlayer; // returns the player object matching "playername" or nil
 * Usage: ["playername", true] call admintoolkit_fetchPlayer; // returns the player name only matching "playername" or nil
 * Usage: [nil, true] call admintoolkit_fetchPlayer; // returns the player name only matching "playername" or nil
 * Usage: call admintoolkit_fetchPlayer; // returns the array of all player units or nil if no player is available
 */
private['_match', '_nameOnly', '_result'];
_nameOnly = false;
_match = '';
_result = [];
if(typeName _this == "ARRAY") then {
	_match = _this select 0;
	if(count _this > 1) then { _nameOnly = _this select 1; };
};

{
	if(_match == '' and _nameOnly) then {
		_result pushBack (name _x);
	} else {
		if(name _x isEqualTo _match) exitWith {
			if(_nameOnly) then {
				_result pushBack (name _x);
			} else {
				_result pushBack _x;
			};
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