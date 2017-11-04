disableSerialization;

// overwrite the OnExecute code from AdminToolkit_OnExecute
AdminToolkit_OnExecute = {
    private _object = objNull;

    switch (AdminToolkit_Action) do {
        case "vai_enemy": {
            ['vai_enemy', ""] call AdminToolkit_doAction;
        };
        case "vai_friend": {
            ['vai_friend', ""] call AdminToolkit_doAction;
        };
        case "vai_attack": {
            //['vai_attack', [AdminToolkit_Selection, AdminToolkit_Player]] call AdminToolkit_doAction;
			_object = objectFromNetId AdminToolkit_Selection;
			_object doFire cursorObject;
        };
        case "vai_delete": {
            ['vai_delete', AdminToolkit_Selection] call AdminToolkit_doAction;
        };
        default {
            systemChat format["Unknown action %1", AdminToolkit_Action];
         };
    };
};

AdminToolkit_VanillaAI_loadDetails = {
    params['_filter'];

    private _show = false;
    private _list = [];

    (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Sorry, not fully implemented yet:</t>";

    _show;
};


VanillaAI_UnitList = {
    params['_units'];

    private _object = objNull;
    private _names = [];

    {
        _object = objectFromNetId _x;
        _names pushBack [name _object, _x];
    } forEach (_units);

    _names;
};

"VanillaAI_Units" addPublicVariableEventHandler {
    params['_id','_unit'];

    private _names = [_unit] call VanillaAI_UnitList;
    lbClear RscAdminToolkitList_IDC;
    [RscAdminToolkitList_IDC, _names, ""] call AdminToolkit_uiList;
};

[
    ['New Enemy AI', 'vai_enemy'],
    ['New Friendly AI', 'vai_friend'],
    ['Attack Target', 'vai_attack'],
    ['Delete selected AI', 'vai_delete']
];
