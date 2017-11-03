/**
 * AdminToolkit
 * 
 * Author: ole1986
 * Website: https://github.com/ole1986/a3-admintoolkit
 *
 * This work is licensed under a Creative Commons Attribution-NonCommercial 4.0 International License.
 */

private['_display','_index','_text', '_value'];
_display = findDisplay 40000;

_index = lbCurSel RscAdminToolkitDetailList_IDC;
_text = lbText [RscAdminToolkitDetailList_IDC, _index];
_value = lbData [RscAdminToolkitDetailList_IDC, _index];

switch (AdminToolkit_Action) do {
    case "givevehicle": {
        if(count AdminToolkit_Params < 1) then {
            [_value] call AdminToolkit_addParam;
            "_players" call AdminToolkit_loadDetails;
            (_display displayCtrl RscAdminToolkitDetailLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Step 2: Select player</t>";
        } else {
            [_value] call AdminToolkit_addParam;
            (_display displayCtrl RscAdminToolkitParamLabel_IDC) ctrlSetStructuredText parseText "<t color='#FF0066'>Step 3: Press Run</t>";
        };
    };
    default {
        AdminToolkit_Params = [];
        [_value] call AdminToolkit_addParam;
    };
};