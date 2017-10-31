private['_result'];
disableSerialization;

// overwrite the OnExecute code from AdminToolkit_OnExecute
AdminToolkit_OnExecute = {
    private ["_data"];

    AdminToolkit_Params = ctrlText RscAdminToolkitParam_IDC;
    
    _data = lbData [RscAdminToolkitDetailList_IDC, lbCurSel RscAdminToolkitDetailList_IDC];

    switch (AdminToolkit_Action) do {
        case "exile_repvehicle": {
            ['exile_repvehicle', _data] call AdminToolkit_doAction;
        };
        case "exile_destvehicle": {
            ['exile_destvehicle', _data] call AdminToolkit_doAction;
        };
        case "exile_delvehicle": {
            ['exile_delvehicle', _data] call AdminToolkit_doAction;
        };
        case "exile_getvehicle": {
            [AdminToolkit_Action] call AdminToolkit_doAction;
        };
        case "exile_getmoney": {
            ['exile_getmoney', parseNumber AdminToolkit_Params] call AdminToolkit_doAction;
        };
        case "exile_getheal": {
            ['exile_getheal', ""] call AdminToolkit_doAction;
        };
        case "exile_getscore": {
            ['exile_getscore', parseNumber AdminToolkit_Params] call AdminToolkit_doAction;
        };
        default {
            systemChat format["Unknown action %1", AdminToolkit_Action];
         };
    };
};

AdminToolkit_ExileMod_loadDetails = {
    private ["_filter","_list", "_show"];

    _filter = _this select 0;
    _show = false;

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
        case "exile_getmoney": {
            (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>How much Money, Sir? (E.g. 10000):</t>";
            (_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow true;
        };
        case "exile_getscore": {
            (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Its all about Respect, How many?<br />(E.g. 100):</t>";
            (_display displayCtrl RscAdminToolkitParam_IDC) ctrlShow true;
        };
    };
    _show;
};

_result = [
    ['Repair (nearby)', 'exile_repvehicle'],
    ['Destroy (nearby)', 'exile_destvehicle'],
    ['Remove (nearby)', 'exile_delvehicle'],
    ['Perm Spawn', 'exile_getvehicle'],
    ['Get Money', 'exile_getmoney'],
    ['Get Respect', 'exile_getscore'],
    ['Heal Me', 'exile_getheal']
];

_result;