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
 * HINT: possible battleye filter required for allPlayers
 * 
 * Usage: "playername" call admintoolkit_fetchPlayer; // returns the player unit matching "playername" or nil
 * Usage: call admintoolkit_fetchPlayer; // returns the array of all players or nil if no player is available
 */
private['_filter', '_result'];
_filter = _this;

_result = [];
{
	if(isNil "_filter") then {
		_result pushBack _x;
	} else {
		if(name _x == _filter) then {
			_result pushBack _x;
		};
	};
	
} forEach allPlayers;

if(count _result <= 0) then {
	_result = nil;
} else {
	if(count _result == 1) then {
		_result = _result select 0;
	};
}

_result;