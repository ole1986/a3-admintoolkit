/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

params ['_target', '_title', '_headline', '_scrolltext', '_period'];

if (count _title <= 0) then {
	_title = "<t>ATK</t>";
};

private _dot = _headline find '.';

if (_dot > -1 && count _scrolltext <= 0) then {
	_scrolltext = (_headline splitString ".") select 1;
	_headline = (_headline splitString ".") select 0;
};

_headline = format["<br /><t size='2'>%1</t>", _headline];
_scrolltext = format["<t size='200'> </t>%1", _scrolltext];

// the below remoteExecCall us used to display the AAN at targets screen
[parseText (_title + _headline), parseText _scrolltext] remoteExec ["BIS_fnc_AAN", _target];
if (!isNil "_period" && typeName _period == "SCALAR") then {
	[_target, _period] spawn {
		sleep (_this select 1);
		{ (uinamespace getvariable "BIS_AAN") closedisplay 1; } remoteExecCall ["call", _this select 0];
	};
};