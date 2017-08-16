private['_result', '_object', '_tmp'];
disableSerialization;

// Use the foreach to add some actions into the action list, once EXTENSION is selected
{
    _x call AdminToolkit_addAction;
} forEach [
    ['New Enemy AI', 'vai_enemy'],
    ['New Friendly AI', 'vai_friend'],
    ['Attack Target', 'vai_attack'],
    ['Delete selected AI', 'vai_delete']
];

// overwrite the OnExecute code from AdminToolkit_OnExecute
AdminToolkit_OnExecute = {
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

VanillaAI_UnitList = {
    private['_names', '_object'];
    _names = [];
    {
        _object = objectFromNetId _x;
        _names pushBack [name _object, _x];
    } forEach (_this select 0);

    _names;
};

"VanillaAI_Units" addPublicVariableEventHandler {
    private['_names'];
    _names = [_this select 1] call VanillaAI_UnitList;
    lbClear RscAdminToolkitList_IDC;
    [RscAdminToolkitList_IDC, _names, ""] call AdminToolkit_uiList;
};

_result = [VanillaAI_Units] call VanillaAI_UnitList;
_result;