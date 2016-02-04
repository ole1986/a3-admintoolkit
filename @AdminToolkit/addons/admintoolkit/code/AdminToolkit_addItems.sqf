/**
 * AdminToolkit - An arma3 administration helper tool
 * @author ole1986
 */
 
private['_listboxId','_list', '_filter','_counter', '_className', '_displayName'];
disableSerialization;
// listbox IDC
_listboxId = _this select 0;
// array of config classes
_list = _this select 1;
// string filter expression
_filter = _this select 2;

_counter = 0;
{
	// get the weapon, vehicle, item CLASS name, like "B_Heli_Light_01_F"
	_className = configName _x;
	// get the display name of the current class
	_displayName = getText(_x >> "displayName");
	
	if(_filter == "") then {
		lbAdd [_listboxId, _displayName];
		lbSetData [_listboxId, _counter, _className];
		_counter = _counter + 1;
	} else {
		if(toLower _displayName find _filter >= 0) then 
		{
			lbAdd [_listboxId, _displayName];
			lbSetData [_listboxId, _counter, _className];
		};
	};
} forEach _list;

true;