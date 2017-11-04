disableSerialization;

// overwrite the OnExecute code from AdminToolkit_OnExecute
AdminToolkit_OnExecute = {
    private _object = objNull;
    private _data = lbData [RscAdminToolkitDetailList_IDC, lbCurSel RscAdminToolkitDetailList_IDC];
    private _userInput = ctrlText RscAdminToolkitParam_IDC;

    switch (AdminToolkit_Action) do {
        case "exile_repvehicle";
        case "exile_destvehicle";
        case "exile_delvehicle": {
            [AdminToolkit_Action, _data] call AdminToolkit_doAction;
        };
        case "exile_setvehiclepin": {
            [AdminToolkit_Action, [_data, _userInput]] call AdminToolkit_doAction;
        };
        case "exile_getvehicle": {
            [AdminToolkit_Action, _data] call AdminToolkit_doAction;
        };
        case 'exile_sendmoney';
		case 'exile_sendscore': {
            [AdminToolkit_Action, [_data, parseNumber _userInput]] call AdminToolkit_doAction;
		};
        case "exile_getmoney": {
            ['exile_getmoney', parseNumber _userInput] call AdminToolkit_doAction;
        };
        case "exile_getscore": {
            ['exile_getscore', parseNumber _userInput] call AdminToolkit_doAction;
        };
        case "exile_getheal": {
            ['exile_getheal', ""] call AdminToolkit_doAction;
        };
        default {
            systemChat format["Unknown action %1", AdminToolkit_Action];
         };
    };
};

AdminToolkit_ExileMod_loadDetails = {
    params["_filter"];

    private _show = false;
    private _list = [];
    private _player = objNull;

    switch (AdminToolkit_Action) do {
        case "exile_destvehicle";
        case "exile_delvehicle";
        case "exile_repvehicle": {
            _list = nearestObjects [player, ["Car", "Tank", "Helicopter", "Plane"], 50];
		    [RscAdminToolkitDetailList_IDC, _list, _filter] call AdminToolkit_uiList;
            _show = true;
        };
        case "exile_getvehicle": {
            _list = "(getText(_x >> 'VehicleClass') in ['ExileCars', 'ExileBikes', 'ExileChoppers','ExileBoats','ExilePlanes']) and (getNumber (_x >> 'scope') == 2)" configClasses (configFile >> "CfgVehicles");
            [RscAdminToolkitDetailList_IDC, _list, _filter] call AdminToolkit_uiList;
            _show = true;
        };
        case "exile_setvehiclepin": {
            _list = nearestObjects [player, ["Car", "Tank", "Helicopter", "Plane"], 50];
		    [RscAdminToolkitDetailList_IDC, _list, _filter] call AdminToolkit_uiList;

            (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Enter a valid PIN here (E.g. 1234):</t>";
            (_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow true;
            _show = true;
        };
        case "exile_getmoney": {
            (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>How much Money, Sir? (E.g. 10000):</t>";
            (_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow true;
        };
        case "exile_getscore": {
            (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Its all about Respect, How many?<br />(E.g. 100):</t>";
            (_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow true;
        };
        case "exile_sendmoney": {
            {
                _tmp = lbAdd [RscAdminToolkitDetailList_IDC, name (objectFromNetId _x)];
                lbSetData [RscAdminToolkitDetailList_IDC, _tmp, _x];
            } forEach AdminToolkit_Players;
            _show = true;

            (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Enter the amount of money here <br />(E.g. 1000):</t>";
            (_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Select player you want to give money</t>";
            (_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow true;
        };
        case "exile_sendscore": {
            {
                _tmp = lbAdd [RscAdminToolkitDetailList_IDC, name (objectFromNetId _x)];
                lbSetData [RscAdminToolkitDetailList_IDC, _tmp, _x];
            } forEach AdminToolkit_Players;
            _show = true;

            (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Enter the amount of points here <br />(E.g. 1000):</t>";
            (_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Select player you want to give respect points</t>";
            (_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow true;
        };
    };
    _show;
};

[
    ['Repair (nearby)', 'exile_repvehicle'],
    ['Destroy (nearby)', 'exile_destvehicle'],
    ['Remove (nearby)', 'exile_delvehicle'],
    ['Set Vehicle PIN (nearby)', 'exile_setvehiclepin'],
    ['Perm Spawn', 'exile_getvehicle'],
    ['Get Money', 'exile_getmoney'],
    ['Get Respect', 'exile_getscore'],
    ['Send Money to Player', 'exile_sendmoney'],
    ['Send Respect to Player', 'exile_sendscore'],
    ['Heal Me', 'exile_getheal']
];