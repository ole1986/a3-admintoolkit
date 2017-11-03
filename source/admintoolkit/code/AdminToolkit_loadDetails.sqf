/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_which', '_filter','_display', '_list', '_tmp', '_tmp2', '_show', '_menuData', '_extCode'];
disableSerialization;
_display = findDisplay 40000;

_show = false;

if(typeName _this == "STRING") then {
	_which = _this;
} else {
	_which = AdminToolkit_Action;
};

// ### Search filter
_filter = ctrlText RscAdminToolkitEditDetail_IDC;
if(_filter != "") then {
	// search filter is set, so reset the textbox
	ctrlSetText [RscAdminToolkitEditDetail_IDC, ""];	
	// and tell user in systemChat its filtered view
	systemChat format["Searching for '%1' in details list", _filter];	
};

// clear details list
lbClear RscAdminToolkitDetailList_IDC;

switch (_which) do {
	case "_players";
	case "message";
	case "tp2player";
	case "tpplayer";
	case "specplayer";
	case "kickplayer";
	case "banplayer";
	case "giveammo": {
		{
			_tmp = lbAdd [RscAdminToolkitDetailList_IDC, name (objectFromNetId _x)];
			lbSetData [RscAdminToolkitDetailList_IDC, _tmp, _x];
			_tmp2 = getText (configFile >> 'CfgWeapons' >> primaryWeapon (objectFromNetId _x) >> 'picture');
			lbSetPictureRight [RscAdminToolkitDetailList_IDC, _tmp, _tmp2];
		} forEach AdminToolkit_Players;
		_show = true;
	};
	case "givevehicle";
	case "getvehicle": {
		_list = "((getText(_x >> 'VehicleClass') in ['Car', 'Armored', 'Air']) and (getNumber(_x >> 'scope') == 2))" configClasses (configFile >> "CfgVehicles");
		[RscAdminToolkitDetailList_IDC, _list, _filter] call AdminToolkit_uiList;
		_show = true;
	};
	case "removevehicle": {
		_list = nearestObjects [player, ["Car", "Tank", "Helicopter", "Plane"], 50];
		[RscAdminToolkitDetailList_IDC, _list, _filter] call AdminToolkit_uiList;
		_show = true;
	};
	case "getammo";
	case "getweapon": {
		_list = "((getNumber(_x >> 'Type') > 0) and (getNumber(_x >> 'Type') <= 4) and (configName _x find '_Base' <= 0) and (configName _x find '_base' <= 0) and (getNumber(_x >> 'scope') == 2))" configClasses (configFile >> "CfgWeapons");
		[RscAdminToolkitDetailList_IDC, _list, _filter] call AdminToolkit_uiList;
		_show = true;
	};
	case "build";
	case "buildpers": {
		_list = "(configName _x isKindOf 'Building') and !(configName _x isKindOf 'ReammoBox') and (getNumber(_x >> 'scope') == 2)" configClasses (configFile>>"CfgVehicles");
		[RscAdminToolkitDetailList_IDC, _list, _filter] call AdminToolkit_uiList;
		_show = true;
	};
	case "spawn": {
		_list ="((configName _x isKindOf 'ReammoBox') and (getNumber(_x >> 'scope') == 2))" configClasses (configFile >> "CfgVehicles");
		[RscAdminToolkitDetailList_IDC, _list, _filter] call AdminToolkit_uiList;
		_show = true;
	};
	case "getitem": {
		_list = "(getNumber(_x >> 'Type') == 256) and (getNumber(_x >> 'scope') == 2)" configClasses (configFile >> "CfgMagazines");
		[RscAdminToolkitDetailList_IDC, _list, _filter] call AdminToolkit_uiList;
		_show = true;
	};
	case "messageall";
	case "godmodeoff";
	case "buildremove";
	case "buildinfopersistent";
	case "savepersistent";
	case "clearpersistent";
	case "godmodeon";
	case "": {
		/* manage all non extension actions not listed above */	
	};
	default {
		_menuData = lbData [RscAdminToolkitMainMenu_IDC, AdminToolkit_MenuIndex];
        _extCode = missionNamespace getVariable [format["%1_loadDetails", _menuData], ""];
        if(typeName _extCode == "CODE") then {
            systemChat format["Calling %1 action %2", _menuData, _value];
            _show = [_filter] call _extCode;
        } else {
            systemChat format["ERROR: Failed to call action %1", _value];
        };
    };
};

_show call AdminToolkit_toggleDetail;