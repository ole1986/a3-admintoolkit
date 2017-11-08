/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */
 
params['_listboxId','_list', '_filter'];
disableSerialization;
// string filter expression
_filter = toLower _filter;

private _index = nil;
private _className = '';
private _displayName = '';
private _picture = '';
private _add = false;

{
	// get the weapon, vehicle, item CLASS name, like "B_Heli_Light_01_F"
	if(typeName _x == "CONFIG") then {
		_className = configName _x;
		// get the display name of the current class
		_displayName = getText(_x >> "displayName");
		_picture = getText(_x >> "Picture");
	} else {
		if(typeName _x == "ARRAY") then {
			_displayName = _x select 0;
			_className = _x select 1;
		} else {
			if(typeName _x == "OBJECT") then {
				_displayName = getText(configFile >> "CfgVehicles" >> (typeof _x) >> "displayName");
				_picture = getText(configFile >> "CfgVehicles" >> (typeof _x) >> "picture");
				_className = netId _x;
			} else {
				_className = str _x;
				_displayName = _className;
			}
			
		};
	};
	
	if (_displayName == "") then {
		_displayName = _className;
	};

	if (_filter != '') then {
		// use filtered mode
		if(toLower _displayName find _filter >= 0) then {
			_add = true;
		} else {
			_add = false;
		};
	} else {
		_add = true;
	};

	if (_add) then {
		_index = lbAdd [_listboxId, _displayName];
		lbSetData [_listboxId, _index, _className];
		if((_picture != "") and (_picture != "picturestaticobject") and (_picture != "picturething")) then {
			lbSetPictureRight [_listboxId, _index, _picture];
		};
	};
} forEach _list;

true;