/**
 * AdminToolkit
 * 
 * Author: Stoll
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

disableSerialization;

// overwrite the OnExecute code from AdminToolkit_OnExecute
AdminToolkit_OnExecute = {   
    private _data = lbData [RscAdminToolkitDetailList_IDC, lbCurSel RscAdminToolkitDetailList_IDC];

    switch (AdminToolkit_Action) do {
        case "fu_build": {
            ['build', _data] call AdminToolkit_doAction;
        };
        case "fu_buildpers": {
            ['buildpers', _data] call AdminToolkit_doAction;
        };
        default {
            [AdminToolkit_Action] call AdminToolkit_doAction;
         };
    };
};

AdminToolkit_Furniture_loadDetails = {
    params["_filter"];

    private _show = false;
    private _list = [];

    switch (AdminToolkit_Action) do {
        case "fu_build";
        case "fu_buildpers": {
            _list = "(getText(_x >> 'vehicleClass') in ['Furniture','Structures','Tents','Cargo','Dead_bodies','Market','Small_items','Fortifications','Signs']) and (getNumber(_x >> 'scope') == 2)" configClasses (configFile>>"CfgVehicles");
		    [RscAdminToolkitDetailList_IDC, _list, _filter] call AdminToolkit_uiList;
            _show = true;
        };
    };
    _show;
};

[
    ["Build (temporary)", 'fu_build'],
    ["Build (persistent)", 'fu_buildpers'],
    ["Remove (Target)", "buildremove"],
    ["Status", 'buildinfopersistent'],
    ["Save Persistent", 'savepersistent'],
    ["Clear Persistent", 'clearpersistent']
];