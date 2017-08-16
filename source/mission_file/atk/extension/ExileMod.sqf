private['_result'];
disableSerialization;

// Use the foreach to add some actions into the action list, once EXTENSION is selected
{
    _x call AdminToolkit_addAction;
} forEach [
    ['Repair', 'exile_repvehicle'],
    ['Destroy', 'exile_destvehicle'],
    ['Remove', 'exile_delvehicle'],
    ['Perm Spawn', 'exile_getvehicle'],
    ['Temporary Spawn', 'getvehicle'],
    ['Get Money', 'exile_getmoney'],
    ['Get Respect', 'exile_getscore'],
    ['Heal Me', 'exile_getheal']
];

// overwrite the OnExecute code from AdminToolkit_OnExecute
AdminToolkit_OnExecute = {
    AdminToolkit_Params = ctrlText RscAdminToolkitParam_IDC;
    //systemChat format["Parameters: %1", AdminToolkit_Params];

    switch (AdminToolkit_Action) do {
        case "exile_repvehicle": {
            ['exile_repvehicle', cursorObject] call AdminToolkit_doAction;
        };
        case "exile_destvehicle": {
            ['exile_destvehicle', cursorObject] call AdminToolkit_doAction;
        };
        case "exile_delvehicle": {
            ['exile_delvehicle', cursorObject] call AdminToolkit_doAction;
        };
        case "exile_getvehicle": {
            [AdminToolkit_Action] call AdminToolkit_doAction;
        };
        case "getvehicle": {
            [AdminToolkit_Action] call AdminToolkit_doAction;
        };
        case "exile_getmoney": {
            ['exile_getmoney', 10000] call AdminToolkit_doAction;
        };
        case "exile_getheal": {
            ['exile_getheal', ""] call AdminToolkit_doAction;
        };
        case "exile_getscore": {
            ['exile_getscore', 1000] call AdminToolkit_doAction;
        };
        default {
            systemChat format["Unknown action %1", AdminToolkit_Action];
         };
    };

};

_result = "(getText(_x >> 'VehicleClass') in ['ExileCars', 'ExileBikes', 'ExileChoppers','ExileBoats','ExilePlanes']) and (getNumber (_x >> 'scope') == 2)" configClasses (configFile >> "CfgVehicles");
_result;